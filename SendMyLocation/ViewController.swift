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
var contacts = Contact().getinfo()
class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let contact = Contact()
        contact.checkAuth()
        print("what")
        contacts = contact.getinfo()
        DispatchQueue.main.async {
            self.tableView.reloadData()
            print("pizza")
        }

                //sms().send(target: "blah", Message: "blah")

        // Do any additional setup after loading the view, typically from a nib.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print("yes")
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("jhkhjhh")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.accessoryType = .detailDisclosureButton
        let contact = contacts[indexPath.section]
        var button = UIButton(type : .custom)
        let title = (contact.firstname + " " + contact.lastname)
        button.setTitle("send", for: .normal)
        buttons.append(button)
        print(contact.firstname)
//        cell.imageView?.image = button.backgroundImage(for: .normal)
        cell.textLabel?.text = (contact.firstname + " " + contact.lastname)
//        print(cell.textLabel?.text)

        return cell
    }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        //doSomethingWithItem(indexPath.row)
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
