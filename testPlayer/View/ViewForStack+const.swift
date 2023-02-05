//
//  ViewForStack+const.swift
//  testPlayer
//
//  Created by Александр Борисов on 29.12.2022.
//

import Foundation
import SnapKit


extension ViewForStack {

    func configureConstraints() {
        [trackImage, trackName, trackDuration].forEach { box in
            self.addSubview(box)
        }

        trackImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(Singleton.ViewForStackTrackImageConstrains.leading.rawValue)
            make.width.height.equalTo(Singleton.ViewForStackTrackImageConstrains.widthHeight.rawValue)
        }

        trackName.snp.makeConstraints { make in
            make.leading.equalTo(trackImage.snp.trailing).offset(Singleton.ViewForStackTrackNameConstrains.leading.rawValue)
            make.trailing.equalTo(trackDuration.snp.leading)
            make.centerY.equalTo(trackImage.snp.centerY)
            make.height.equalTo(Singleton.ViewForStackTrackNameConstrains.height.rawValue)
        }

        trackDuration.snp.makeConstraints { make in
            make.centerY.equalTo(trackImage.snp.centerY)
            make.trailing.equalToSuperview().offset(Singleton.ViewForStackTrackDurationConstrains.trailing.rawValue)
            make.height.equalTo(Singleton.ViewForStackTrackDurationConstrains.height.rawValue)
            make.width.equalTo(Singleton.ViewForStackTrackDurationConstrains.width.rawValue)
        }
    }
}
