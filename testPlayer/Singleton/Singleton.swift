//
//  Singleton.swift
//  testPlayer
//
//  Created by Александр Борисов on 05.01.2023.
//

import Foundation
import UIKit

struct Singleton {
    static var shared = Singleton()

    private init(){}

    // начаотная громкость при включении трека
    var sliderValue: Float = 0.5

    let trackNameFont = UIFont.systemFont(ofSize: 17, weight: .medium)
    let trackDurationFont = UIFont.systemFont(ofSize: 14, weight: .bold)
    let playAlbumAuthorHeadLabelFont = UIFont.systemFont(ofSize: 13, weight: .bold)
    let timePassedTimeLeftFont = UIFont.systemFont(ofSize: 10, weight: .light)

    //MARK: - для разделительных линий (ViewForStack)
    enum Line: CGFloat {
        case moveTo = 75
        case width = 410
        case height = 2
        case alfa = 0.3
    }

    //MARK: - размеры больших кнопок (PlayerViewController)
    enum SmallButton: Int {
        case widthWidth = 20
    }

    //MARK: - размеры маленьких кнопок (PlayerViewController)
    enum BigButton: Int {
        case widthWidth = 40
    }

    //MARK: - прозрачность (PlayerViewController)
    enum PlayerAlfa: CGFloat {
        case common = 0.3
        case playPause = 0.6
        case playPauseHidden = 1.0
    }

    //MARK: - имена для кнопок проигрывателя (PlayerViewController)
    enum ImageNameOfPlayerButton: String {
        case shuffleButton = "shuffle"
        case backwardButton = "backward.end.fill"
        case playButton = "play.fill"
        case pauseButton = "pause.fill"
        case forwardButton = "forward.end.fill"
        case repeatButton = "repeat"
        case leftHeadButton = "chevron.compact.down"
        case sharedHeadButton = "square.and.arrow.up"
    }

    // константы для констрейнтов прописывал отдельно для каждого элемента, чтобы всегда можно было настроить их индивиуально
    //MARK: - constants for constraints in configureConstraints() (ViewForStack)
    enum ViewForStackTrackImageConstrains: Int {
        case leading = 10
        case widthHeight = 70
    }

    enum ViewForStackTrackNameConstrains: Int {
        case leading = 10
        case height = 40
    }

    enum ViewForStackTrackDurationConstrains: Int {
        case trailing = -10
        case height = 20
        case width = 40
    }

    //MARK: - constants for constraints in setupConstraints() (StackViewController)
    enum StackViewControllerStackViewConstrains: Int {
        case top = 150
        case bottom = -150
    }

    //MARK: - constants for constraints in setupConstraints() (PlayerViewController)
    enum PlayerViewControllerLeftHeadButtonConstrains: Int {
        case top = 100
        case leading = 22
        case heightWidth = 20
    }

    enum PlayerViewControllerSharedHeadButtonConstrains: Int {
        case top = 100
        case trailing = -22
        case heightWidth = 20
    }

    enum PlayerViewControllerPlayHeadLabelConstrains: Int {
        case top = 90
    }

    enum PlayerViewControllerAlbumImageConstrains: Int {
        case top = 150
        case heightWidth = 380
    }

    enum PlayerViewControllerTrackNameConstrains: Int {
        case top = 20
        case height = 30
        case width = 150
    }

    enum PlayerViewControllerAuthorNameConstrains: Int {
        case height = 20
        case width = 100
    }

    enum PlayerViewControllerTimeSliderConstrains: Int {
        case top = 20
        case width = 380
    }

    enum PlayerViewControllerTimePassedConstrains: Int {
        case bottom = -5
        case width = 40
        case height = 10
    }

    enum PlayerViewControllerTimeLeftConstrains: Int {
        case bottom = -5
        case width = 40
        case height = 10
    }

    enum PlayerViewControllerStackViewConstrains: Int {
        case top = 25
        case width = 380
    }

    enum PlayerViewControllerVolumeSliderConstrains: Int {
        case top = 30
        case width = 190
    }

}
