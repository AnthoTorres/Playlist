//
//  SongController.swift
//  PlaylistCodable
//
//  Created by Aaron Martinez on 11/1/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

import Foundation

class SongController {
    
    static func create(songWithName name: String, artist: String, playlist: Playlist) {
        //Creating a song and it is by default being added to out MOC
        _ = Song(artist: artist, songName: name, playlist: playlist)
        //Enures that any changes that have been made are saved to Manage Object Context to persistent store
        PlaylistController.shared.saveToPersistentStore()
    }
    
    static func delete(song: Song) {
        let moc = CoreDataStack.context
        //Deleting the song from our Manage Object Context
        moc.delete(song)
        PlaylistController.shared.saveToPersistentStore()
    }
    
}
