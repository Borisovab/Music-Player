//
//  PlayerVC+const.swift
//  testPlayer
//
//  Created by Александр Борисов on 29.12.2022.
//

import Foundation
import SnapKit

extension PlayerViewController {

    func setupConstraints() {
        [leftHeadButton, sharedHeadButton, playHeadLabel, albumHeadName, albumImage, authorName, trackName, timeSlider, timePassed, timeLeft, stackView, volumeSlider].forEach { box in
            view.addSubview(box)
        }

        leftHeadButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Singleton.PlayerViewControllerLeftHeadButtonConstrains.top.rawValue)
            make.leading.equalToSuperview().offset(Singleton.PlayerViewControllerLeftHeadButtonConstrains.leading.rawValue)
            make.height.width.equalTo(Singleton.PlayerViewControllerLeftHeadButtonConstrains.heightWidth.rawValue)
        }

        sharedHeadButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Singleton.PlayerViewControllerSharedHeadButtonConstrains.top.rawValue)
            make.trailing.equalToSuperview().offset(Singleton.PlayerViewControllerSharedHeadButtonConstrains.trailing.rawValue)
            make.height.width.equalTo(Singleton.PlayerViewControllerSharedHeadButtonConstrains.heightWidth.rawValue)
        }

        playHeadLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Singleton.PlayerViewControllerPlayHeadLabelConstrains.top.rawValue)
            make.centerX.equalToSuperview()
            make.leading.equalTo(leftHeadButton.snp.trailing)
            make.trailing.equalTo(sharedHeadButton.snp.leading)
        }

        albumHeadName.snp.makeConstraints { make in
            make.top.equalTo(playHeadLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.leading.equalTo(leftHeadButton.snp.trailing)
            make.trailing.equalTo(sharedHeadButton.snp.leading)
        }

        albumImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Singleton.PlayerViewControllerAlbumImageConstrains.top.rawValue)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(Singleton.PlayerViewControllerAlbumImageConstrains.heightWidth.rawValue)
        }

        trackName.snp.makeConstraints { make in
            make.top.equalTo(albumImage.snp.bottom).offset(Singleton.PlayerViewControllerTrackNameConstrains.top.rawValue)
            make.centerX.equalToSuperview()
            make.height.equalTo(Singleton.PlayerViewControllerTrackNameConstrains.height.rawValue)
            make.width.equalTo(Singleton.PlayerViewControllerTrackNameConstrains.width.rawValue)
        }

        authorName.snp.makeConstraints { make in
            make.top.equalTo(trackName.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(Singleton.PlayerViewControllerAuthorNameConstrains.height.rawValue)
            make.width.equalTo(Singleton.PlayerViewControllerAuthorNameConstrains.width.rawValue)
        }

        timeSlider.snp.makeConstraints { make in
            make.top.equalTo(authorName.snp.bottom).offset(Singleton.PlayerViewControllerTimeSliderConstrains.top.rawValue)
            make.centerX.equalToSuperview()
            make.width.equalTo(Singleton.PlayerViewControllerTimeSliderConstrains.width.rawValue)
        }

        timePassed.snp.makeConstraints { make in
            make.bottom.equalTo(timeSlider.snp.top).offset(Singleton.PlayerViewControllerTimePassedConstrains.bottom.rawValue)
            make.leading.equalTo(timeSlider.snp.leading)
            make.width.equalTo(Singleton.PlayerViewControllerTimePassedConstrains.width.rawValue)
            make.height.equalTo(Singleton.PlayerViewControllerTimePassedConstrains.height.rawValue)
        }

        timeLeft.snp.makeConstraints { make in
            make.bottom.equalTo(timeSlider.snp.top).offset(Singleton.PlayerViewControllerTimeLeftConstrains.bottom.rawValue)
            make.trailing.equalTo(timeSlider.snp.trailing)
            make.width.equalTo(Singleton.PlayerViewControllerTimeLeftConstrains.width.rawValue)
            make.height.equalTo(Singleton.PlayerViewControllerTimeLeftConstrains.height.rawValue)
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(timeSlider.snp.bottom).offset(Singleton.PlayerViewControllerStackViewConstrains.top.rawValue)
            make.centerX.equalToSuperview()
            make.width.equalTo(Singleton.PlayerViewControllerStackViewConstrains.width.rawValue)
        }

        volumeSlider.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(Singleton.PlayerViewControllerVolumeSliderConstrains.top.rawValue)
            make.centerX.equalToSuperview()
            make.width.equalTo(Singleton.PlayerViewControllerVolumeSliderConstrains.width.rawValue)
        }
    }
}
