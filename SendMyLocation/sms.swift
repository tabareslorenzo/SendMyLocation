//
//  sms.swift
//  SendMyLocation
//
//  Created by Lorenzo Tabares on 7/7/19.
//  Copyright © 2019 Lorenzo Tabares. All rights reserved.
//

import Foundation
import MessageUI

class sms : NSObject, MFMessageComposeViewControllerDelegate {
//    let smsManager = MFMessageComposeViewController()
    deinit {
        // perform the deinitialization
        print("apples")
        //smsManager.messageComposeDelegate = nil
    }
    func status() -> Bool
    {
        if !MFMessageComposeViewController.canSendText() {
            print("SMS services are not available")
            return false
        }
        return true
    }
    func send(target: String, Message: String) -> MFMessageComposeViewController
    {

            print("yeah")
            let smsManager = MFMessageComposeViewController()
        
            smsManager.messageComposeDelegate = self;

//            for (idobject in viewControllerArray) {
//                NSLog("Object: %@",object);
//            }

            smsManager.recipients = [target]

            //latitude/longitude
            let path = "https://www.google.com/maps/search/?api=1&query="+Message
            smsManager.body = path
            print("please")
            print(smsManager.messageComposeDelegate!)

            return smsManager

//        return MFMessageComposeViewController()

    }
    func messageComposeViewController(_ controller: MFMessageComposeViewController!, didFinishWith result: MessageComposeResult) {
        //smsManager.messageComposeDelegate = nil;
        print("blah")
        controller.dismiss(animated: true, completion: nil)
//        smsManager.messageComposeDelegate = nil;

    }

}



