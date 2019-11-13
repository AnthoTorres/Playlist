//
//  PlaylistController.swift
//  PlaylistCodable
//
//  Created by Aaron Martinez on 11/1/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let shared = PlaylistController()
    
    func add(playlistWithName name: String) {
        //Crearting a new playlist using the name from the parameter, we are initializing it with our CoreDataStack.Context, you just cannot see that happening here because we set a default value in our convenience initializer
        _ = Playlist(name: name)
        //Making sure that our changes to the managed Object Context are saved to persist
        saveToPersistentStore()
    }
    
    func delete(playlist: Playlist) {
        let moc = CoreDataStack.context
        //going to our Manage Object Context and removing the playlist from it
        moc.delete(playlist)
        //Ensuring that the playlist has been deleted from our persistent store
        saveToPersistentStore()
    }
    
    // MARK: - Persistence
   
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
            //TRYING to save what is in our MOC to our persistent store
            try moc.save()
        } catch {
            //Catching the error from the do try catch block and printing what the error is
            print("There was a problem saving to persistance store: \(error.localizedDescription)")
        }
    }
    // MARK: - Properties
    //Making our playlist array a computed property
    var playlists: [Playlist] {
        //Creating our fetch request and specifying that it will be of type playlist
        let request: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        // Returing our array of playlist, nil coelesscing to an empty array if the request didnt work
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
}
