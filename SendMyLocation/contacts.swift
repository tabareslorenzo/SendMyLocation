//
//  contacts.swift
//  SendMyLocation
//
//  Created by Lorenzo Tabares on 7/6/19.
//  Copyright © 2019 Lorenzo Tabares. All rights reserved.
//

import Foundation
import Contacts

let contactsManager = CNContactStore()
struct contactInfo{
    let firstname : String
    let lastname : String
    let PhoneNumber: String
    init(f:String, l:String, p:String)
    {
        firstname = f
        lastname = l
        PhoneNumber = p
    }
    
}

class Contact{
    var contsInfo: [contactInfo] = [contactInfo]()
    func getinfo()->[contactInfo]{
        print("pizzaha")
        return self.contsInfo
    }
    func setinfo(cons: [contactInfo]){
        self.contsInfo = cons
    }
    func checkAuth(){
        let authorizationStatus = CNContactStore.authorizationStatus(for: CNEntityType.contacts)
        switch authorizationStatus {
        case .notDetermined:
            // Request authorization 
            contactsManager.requestAccess(for: CNEntityType.contacts, completionHandler: {(Bool, Error) -> Void
                in
                if(Bool)
                {
                    print("authorized")
                }
                else{
                    print(Error)
                }
            })
            break
            
        case .restricted, .denied:
            // Disable contact features
            print("not authorized")
            break
            
        case .authorized:
            // Enable contact features
            print("authorized")
            self.setinfo(cons: self.extract())
            break
            
        }
    
    }
    //enumerateContacts(CNContactGivenNameKey as CNKeyDescriptor)
    func extract() -> [contactInfo]
    {
        
        var contactsInfo = [contactInfo]()
        var req : CNContactFetchRequest = CNContactFetchRequest(keysToFetch:[CNContactGivenNameKey as CNKeyDescriptor,
            CNContactFamilyNameKey as CNKeyDescriptor, CNContactPhoneNumbersKey as CNKeyDescriptor])
        var contacts : [CNContact] = [CNContact]()
        do{
            try contactsManager.enumerateContacts(with: req){
                (contact,stop)->() in
//                print(contact.givenName)
//                print(contact.familyName)
//                print(contact.phoneNumbers[0].value.stringValue)
                print("hellos")
                contacts.append(contact)
                
            }
        }
        catch{
            contacts = [CNContact]()
            print("error")
        }
        if(!contacts.isEmpty)
        {
            for contact in contacts{
                contactsInfo.append(contactInfo(f: contact.givenName, l: contact.familyName, p: contact.phoneNumbers[0].value.stringValue))
            }
        }
        return contactsInfo
    }
}
