//
//  ViewController.swift
//  SendMyLocation
//
//  Created by Lorenzo Tabares on 7/6/19.
//  Copyright © 2019 Lorenzo Tabares. All rights reserved.
//

import UIKit
import MessageUI

var buttons = [UIButton]()
let contact = Contact()
var contacts = Contact().getinfo()
class ViewController: UITableViewController {

    override func viewDidLoad() {
        print("what")
        print("HAHAHAHHAHAHAHAH")
        //location().AuthStatus()
        NSSetUncaughtExceptionHandler { exception in
            
            print(exception)
            
            print(exception.callStackSymbols)
            
        }
        

//        @try {
//            retVal = UIApplicationMain...
//        }
//        @catch (NSException* exception) {
//            NSLog(@"Uncaught exception %@", exception);
//            NSLog(@"Stack trace: %@", [exception callStackSymbols]);
//        }
//        Contact().getinfo()
//        location().AuthStatus()
        super.viewDidLoad()
//        let contact = Contact()
//        DispatchQueue.main.async {
//            contacts = contact.getinfo()
//            self.tableView.reloadData()
//            print("pizzas")
//        }
        
        contact.checkAuth(completion:{
            DispatchQueue.main.async {
            contacts = contact.getinfo()
            self.tableView.reloadData()
            print("pizzas")
            }})
        location().AuthStatus()
        print("what")
//        contacts = contact.getinfo()
        
//        DispatchQueue.main.async {
//            contacts = contact.getinfo()
//            self.tableView.reloadData()
//            print("pizzas")
//        }
        print("whatwhat")
                //sms().send(target: "blah", Message: "blah")

        // Do any additional setup after loading the view, typically from a nib.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print("yes")
        print(contact.getinfo())
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("burger")

        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("jhkhjhh")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.accessoryType = .detailButton
//        cell.accessoryType = .detailDisclosureButton
        //cell.
        cell.contentView.tag = indexPath.section
        let contact = contacts[indexPath.section]
        var button = UIButton(type : .custom)
        let title = (contact.firstname + " " + contact.lastname)
        button.setTitle("send", for: .normal)
        var label = UILabel(frame: CGRect(x:100, y:100, width:100, height:100))
        label.text = "send"
        label.textColor = .blue
//        cell.addSubview(label)
//        cell.accessoryView = button
//        cell.accessoryType = .detailDisclosureButton
//        buttons.append(button)
        print(contact.firstname)
//        cell.imageView?.image = button.backgroundImage(for: .normal)
        cell.textLabel?.text = (contact.firstname + " " + contact.lastname)
//        print(cell.textLabel?.text)

        return cell
    }

    @IBAction func action(_ sender: UIButton) {
//        print(sender.accessibilityElementCount())
//        print(sender.accessibilityValue)
        let tablecell = sender.superview
        print(tablecell?.tag)
        let tag = tablecell?.tag
        //print(sender.)
        let contact = contacts[tag.unsafelyUnwrapped]
        print("Ha")
        print(contact)
        print(location().AuthStatus().1)
        let msgcon = sms().send(target: contact.PhoneNumber, Message: location().AuthStatus().1)
        self.present(msgcon, animated: true, completion: nil)
        
    }
    
}

extension ViewController: MFMessageComposeViewControllerDelegate
{

   func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult){
        switch(result)
        {
        case .cancelled:
            //The user canceled the composition.
            print("message cancelled")
            
            break
            
        case .sent:
            //The user successfully queued or sent the message.
            print("message sent successfully")
            
            
            break
            
        case .failed:
            //The user’s attempt to save or send the message was unsuccessful.
            print("send message errror")
            
            break
        }
        
    }
}
