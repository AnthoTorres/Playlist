//
//  CoreDataStack.swift
//  PlaylistCodable
//
//  Created by Anthony Torres on 11/13/19.
//  Copyright © 2019 Aaron Martinez. All rights reserved.
//

import Foundation
import CoreData

//Creating a class callde CoreDataStack
class CoreDataStack {
    //Creating and initializing and persistent container
    static let container: NSPersistentContainer = {
        // creating our container and we are matching it with the name from our data model
        let container = NSPersistentContainer(name: "PlaylistCodable")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error) :: \(error.userInfo)")
            }
        }
        return container
    } ()
    // creating a way for us to access the context throught the app.
    static var context: NSManagedObjectContext { return container.viewContext }
}
