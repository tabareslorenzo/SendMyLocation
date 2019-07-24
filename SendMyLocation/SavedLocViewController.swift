//
//  SavedLocViewController.swift
//  SendMyLocation
//
//  Created by Lorenzo Tabares on 7/23/19.
//  Copyright © 2019 Lorenzo Tabares. All rights reserved.
//

import UIKit
import CoreData
import CoreGraphics

var state = SavedLocViewController()
var mylocs = SavedLocations()
var entitylocs: [NSManagedObject] = []
//var location: [String] = [String]()
//NSFetchRequest<NSManagedObject>(entityName: "User")
class SavedLocViewController: UITableViewController {
    var container: NSPersistentContainer!

    var context: NSManagedObjectContext! {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        

        NSSetUncaughtExceptionHandler { exception in
            
            print(exception)
            
            print(exception.callStackSymbols)
        
            
        }
        if(mylocs.getlocations().count == 0)
        {
            do {
                entitylocs = try context.fetch(NSFetchRequest<NSManagedObject>(entityName: "User"))
                for entityloc in entitylocs
                {
                    mylocs.addlocation(loc: entityloc.value(forKeyPath: "location") as! String)
                }
                
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
        
        //print(mylocs.getlocations())
//        guard container != nil else {
            //fatalError("This view needs a persistent container.")
//        }
        state = self
        
        self.tableView.reloadData()
        super.viewDidLoad()
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        print("yes")
        print(mylocs.getlocations().count)
        //self.viewDidLoad()
        return mylocs.getlocations().count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("burger")
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.contentView.tag = indexPath.section
        let myloc = mylocs.getlocations()[indexPath.section]
        
        
        cell.textLabel?.text = "location \(indexPath.section + 1)"
        //        print(cell.textLabel?.text)
        
        return cell
    }
    
    func save(loc:String) {
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)!
        let location = NSManagedObject(entity: entity, insertInto: context)
        location.setValue(loc, forKey: "location")
        do {
            try context.save()
            entitylocs.append(location)
        }catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

        
    @IBAction func openurl(_ sender: UIButton) {
       let tag = sender.superview?.tag
        let str = mylocs.getlocations()[tag.unsafelyUnwrapped]
        let url = URL(string: str)
        print(url)
        UIApplication.shared.open(url!)
    }
    @IBAction func SaveLoc(_ sender: Any) {
        print("wowowowowowoo")
        let baseURL = "http://maps.apple.com/?ll="
        mylocs.addlocation(loc: baseURL + location().AuthStatus().1 as String)
//        mylocs.addlocation(loc: "pizza" + location().AuthStatus().1 as String)
        print(mylocs.getlocations())
        self.save(loc: baseURL + location().AuthStatus().1 as String)
        state.tableView.reloadData()
        state.viewDidLoad()

    }
}
