//
//  StackVC+.swift
//  testPlayer
//
//  Created by Александр Борисов on 29.12.2022.
//

import Foundation
import UIKit

extension StackViewController {

    func fillStack(){

        for i in 0...songs.count - 1 {
            let song = songs[i]
            let track = ViewForStack(name: song.trackName,
                                     image: UIImage(named: song.albumImage),
                                     duration: "\(i + 2):00",
                                     index: i) { [weak self] posIndex in
                guard let self = self
                else { return }

                let playerVC = PlayerViewController(songs: self.songs, song: song, index: posIndex)
                self.present(playerVC, animated: true)
            }
            line(view: track)
            stackView.addArrangedSubview(track)
        }
    }

    func configureSongs() {
        songs = TrackModel().tracks
    }

    //MARK: - рисуем разграничительные линии
    private func line(view: UIView) {

        let moveTo: CGFloat = Singleton.Line.moveTo.rawValue
        let width: CGFloat = Singleton.Line.width.rawValue
        let height: CGFloat = Singleton.Line.height.rawValue

        let myLine = CALayer()
        myLine.frame = CGRect(x: 0, y: view.frame.height + moveTo, width: width, height: height)
        myLine.backgroundColor = UIColor.lightGray.withAlphaComponent(Singleton.Line.alfa.rawValue).cgColor

        view.layer.addSublayer(myLine)
    }
}
