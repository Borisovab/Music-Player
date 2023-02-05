//
//  TrackModel.swift
//  testPlayer
//
//  Created by Александр Борисов on 05.01.2023.
//

import Foundation

struct TrackModel {
    var tracks = [Song]()

    init() {
        setupTracks()
    }

    mutating func setupTracks() {
        let track1 = Song(trackName: "Supermodel",
                          authorName: "Maneskin",
                          albumName: "Supermodel",
                          albumImage: "image1")

        let track2 = Song(trackName: "Wake-up",
                          authorName: "Zivert",
                          albumName: "Loredana",
                          albumImage: "image2")

        tracks.append(track1)
        tracks.append(track2)
    }
}
