//
//  PlayerViewController.swift
//  testPlayer
//
//  Created by Александр Борисов on 29.12.2022.
//

import UIKit
import AVFoundation


class PlayerViewController: UIViewController {

    var position = Int()
    var songs: [Song] = []
    var song: Song?

    var player: AVAudioPlayer?
    var timer: Timer?

    //MARK: - элементы в верхней части view
    var leftHeadButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: Singleton.ImageNameOfPlayerButton.leftHeadButton.rawValue)
        let sizedImage = image?.imageResized(to: CGSize(width: Singleton.SmallButton.widthWidth.rawValue,
                                                        height: Singleton.SmallButton.widthWidth.rawValue))
        button.setImage(sizedImage, for: .normal)
        button.alpha = Singleton.PlayerAlfa.common.rawValue
        return button
    }()

    var sharedHeadButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: Singleton.ImageNameOfPlayerButton.sharedHeadButton.rawValue)
        let sizedImage = image?.imageResized(to: CGSize(width: Singleton.SmallButton.widthWidth.rawValue,
                                                        height: Singleton.SmallButton.widthWidth.rawValue))
        button.setImage(sizedImage, for: .normal)
        button.alpha = Singleton.PlayerAlfa.common.rawValue
        return button
    }()

    var playHeadLabel: UILabel = {
        let label = UILabel()
        label.text = "Playing from album"
        label.textColor = .gray
        label.alpha = Singleton.PlayerAlfa.common.rawValue
        label.textAlignment = .center
        label.font = Singleton.shared.playAlbumAuthorHeadLabelFont
        return label
    }()

    var albumHeadName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = Singleton.shared.playAlbumAuthorHeadLabelFont
        return label
    }()

    //MARK: - элементы в средней и нижней части view

    var albumImage: UIImageView = {
        let image = UIImageView()
        return image
    }()

    var trackName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = Singleton.shared.trackNameFont
        return label
    }()

    var authorName: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.alpha = Singleton.PlayerAlfa.common.rawValue
        label.textAlignment = .center
        label.font = Singleton.shared.playAlbumAuthorHeadLabelFont
        return label
    }()

    var timePassed: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = Singleton.shared.timePassedTimeLeftFont
        return label
    }()

    var timeLeft: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .right
        label.font = Singleton.shared.timePassedTimeLeftFont
        return label
    }()

    var timeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumTrackTintColor = .green
        return slider
    }()

    var volumeSlider: UISlider = {
        let slider = UISlider()
        slider.value = Singleton.shared.sliderValue
        slider.minimumTrackTintColor = .green
        return slider
    }()

    //MARK: - stackView
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20.0
        stack.alignment = .lastBaseline
        stack.distribution = .fillEqually
        [self.shuffleButton,
         self.backwardButton,
         self.playPauseButton,
         self.forwardButton,
         self.repeatButton].forEach { box in
            stack.addArrangedSubview(box)
        }
        return stack
    }()

    //MARK: - кнопки проигрывания в stackView
    var shuffleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: Singleton.ImageNameOfPlayerButton.shuffleButton.rawValue)
        let sizedImage = image?.imageResized(to: CGSize(width: Singleton.SmallButton.widthWidth.rawValue,
                                                        height: Singleton.SmallButton.widthWidth.rawValue))
        button.setImage(sizedImage, for: .normal)
        button.alpha = Singleton.PlayerAlfa.common.rawValue
        return button
    }()

    var backwardButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: Singleton.ImageNameOfPlayerButton.backwardButton.rawValue)
        let sizedImage = image?.imageResized(to: CGSize(width: Singleton.BigButton.widthWidth.rawValue,
                                                        height: Singleton.BigButton.widthWidth.rawValue))
        button.setImage(sizedImage, for: .normal)

        return button
    }()

    var playPauseButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: Singleton.ImageNameOfPlayerButton.playButton.rawValue)
        let sizedImage = image?.imageResized(to: CGSize(width: Singleton.BigButton.widthWidth.rawValue,
                                                        height: Singleton.BigButton.widthWidth.rawValue))
        button.setImage(sizedImage, for: .normal)

        return button
    }()

    var forwardButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: Singleton.ImageNameOfPlayerButton.forwardButton.rawValue)
        let sizedImage = image?.imageResized(to: CGSize(width: Singleton.BigButton.widthWidth.rawValue,
                                                        height: Singleton.BigButton.widthWidth.rawValue))
        button.setImage(sizedImage, for: .normal)
        return button
    }()

    var repeatButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: Singleton.ImageNameOfPlayerButton.repeatButton.rawValue)
        let sizedImage = image?.imageResized(to: CGSize(width: Singleton.SmallButton.widthWidth.rawValue,
                                                        height: Singleton.SmallButton.widthWidth.rawValue))
        button.setImage(sizedImage, for: .normal)
        button.alpha = Singleton.PlayerAlfa.common.rawValue
        return button
    }()

    
    convenience init(songs: [Song], song: Song, index: Int) {
        self.init(nibName: nil, bundle: nil)
        self.songs = songs
        self.song = song
        self.position = index

        albumHeadName.text = songs[index].albumName
        trackName.text = songs[index].trackName
        authorName.text = songs[index].authorName
        albumImage.image = UIImage(named: songs[index].albumImage)
    }

    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        //констреинты
        setupConstraints()

        //конфигурация мелодии
        configure()

        //запуск-остановка проигрывания
        playAction()

        //работа стайдера мелодии
        sliderAction()

        //работа стайдера звыка
        sliderVolumeAction()

        //кнопка перелистывания мелодии на предыдущую в плейлисте
        tapBackwardButton()

        //кнопка перелистывания мелодии на следующую в плейлисте
        tapForwardButton()

        //кнопка скрыть экран
        closeScreen()

        //кнопка поделиться (названием мелодии и картинкой альбома)
        sharedButtonAction()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
}
