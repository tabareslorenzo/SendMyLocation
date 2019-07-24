//
//  SavedLocations.swift
//  SendMyLocation
//
//  Created by Lorenzo Tabares on 7/23/19.
//  Copyright © 2019 Lorenzo Tabares. All rights reserved.
//

import Foundation

class SavedLocations {
    private var locations = [String]()
    func addlocation(loc: String) -> Void
    {
        locations.append(loc)
    }
    func getlocations() -> [String] {
        return self.locations
    }
}
