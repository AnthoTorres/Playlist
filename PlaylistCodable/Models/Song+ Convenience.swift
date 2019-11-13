//
//  Song+ Convenience.swift
//  PlaylistCodable
//
//  Created by Anthony Torres on 11/13/19.
//  Copyright © 2019 Aaron Martinez. All rights reserved.
//

import Foundation
import CoreData

// Song is a manage object
extension Song {
    //Discardable result allows us to forego the wildcarding when creating a new song
    convenience init(artist: String, songName: String, playlist: Playlist, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.artist = artist
        self.songName = songName
        //where we care connecting the relationship when we pass in a playlist
        self.playlist = playlist
    }
}
