//
//  ViewForStack.swift
//  testPlayer
//
//  Created by Александр Борисов on 29.12.2022.
//

import UIKit
import SnapKit

class ViewForStack: UIView {

    var songs = [Song]()
    var objectForNotification: Song!

    var stackPosition = Int()
    var closure: ((Int) -> Void)?

    var trackImage: UIImageView = {
        let image = UIImageView()
        return image
    }()

    var trackName: UILabel = {
        let label = UILabel()
        label.text = "trackName"
        label.textColor = .black
        label.font = Singleton.shared.trackNameFont
        label.textAlignment = .left
        return label
    }()

    var trackDuration: UILabel = {
        let label = UILabel()
        label.text = "trackDuration"
        label.font = Singleton.shared.trackDurationFont
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
    }()


    convenience init(name: String, image: UIImage?, duration: String, index: Int, closure: @escaping (Int) -> Void) {
        self .init(frame: CGRect.zero)

        trackName.text = name
        trackImage.image = image
        trackDuration.text = duration
        self.closure = closure
        self.stackPosition = index

        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.addGestureRecognizer(gesture)
    }

    private override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureConstraints()

    }

    @objc func tapAction() {
        closure?(stackPosition)
    }
}
