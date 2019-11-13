//
//  Playlist+Convenience.swift
//  PlaylistCodable
//
//  Created by Anthony Torres on 11/13/19.
//  Copyright © 2019 Aaron Martinez. All rights reserved.
//

import Foundation
import CoreData

//imporing coredata and extending playlist to allow us to create a convenience initializer
extension Playlist {
    // creating a convenience initializer
    convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
    }
}
