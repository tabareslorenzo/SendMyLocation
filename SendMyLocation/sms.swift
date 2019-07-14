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
    
    func send(target: String, Message: String)
    {
        if !MFMessageComposeViewController.canSendText() {
            print("SMS services are not available")
        }
        else{
            //SmsManager.messageComposeDelegate = self
            print("yeah")
            SmsManager.recipients = [target]
            SmsManager.body = Message
//            SmsManager.MessageComposeViewController(controller: SmsManager, didFinishWithResult: MessageComposeResult)
//            MessageComposeViewController(SmsManager, MessageComposeResult)
//            SmsManager(SmsManager, MessageComposeResult)
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
//
//
