//
//  sms.swift
//  SendMyLocation
//
//  Created by Lorenzo Tabares on 7/7/19.
//  Copyright © 2019 Lorenzo Tabares. All rights reserved.
//

import Foundation
import MessageUI


let SmsManager = MFMessageComposeViewController()

class sms {
    
    func send(target: String, Message: String) -> MFMessageComposeViewController
    {
        if !MFMessageComposeViewController.canSendText() {
            print("SMS services are not available")
            return SmsManager
        }
        else{
            print("yeah")
            SmsManager.recipients = [target]
            //latitude/longitude
            let path = "https://www.google.com/maps/search/?api=1&query="+Message
            SmsManager.body = path
            return SmsManager
        
        }
        
    }
    
}

//extension sms: MFMessageComposeViewControllerDelegate
//{
//    
//    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult){
//        switch(result)
//        {
//        case .cancelled:
//            //The user canceled the composition.
//            print("message cancelled")
//            
//            break
//            
//        case .sent:
//            //The user successfully queued or sent the message.
//            print("message sent successfully")
//            
//            
//            break
//            
//        case .failed:
//            //The user’s attempt to save or send the message was unsuccessful.
//            print("send message errror")
//            
//            break
//        }
//        
//    }
//}


