//
//  SavedLocViewController.swift
//  SendMyLocation
//
//  Created by Lorenzo Tabares on 7/23/19.
//  Copyright © 2019 Lorenzo Tabares. All rights reserved.
//

import UIKit
import CoreData

var state = SavedLocViewController()
var mylocs = SavedLocations()
class SavedLocViewController: UIViewController {
    

    override func viewDidLoad() {

        NSSetUncaughtExceptionHandler { exception in
            
            print(exception)
            
            print(exception.callStackSymbols)
        
            
        }
        print(mylocs.getlocations())
        
        
        super.viewDidLoad()
        
        
    }
    
    @IBAction func Save(_ sender: Any) {
        print("wowowowowowoo")
//        print(type(of: location().AuthStatus().1) )
        let baseURL = "http://maps.apple.com/?ll="
        mylocs.addlocation(loc: baseURL + location().AuthStatus().1 as String)
        print(mylocs.getlocations())
        state.viewDidLoad()
        
    }
    
    
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
//
//        return
//    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return 1
//    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//
//        return
//    }
}
