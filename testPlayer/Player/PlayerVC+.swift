//
//  PlayerVC+.swift
//  testPlayer
//
//  Created by Александр Борисов on 29.12.2022.
//

//import Foundation
import UIKit
import AVFoundation


extension PlayerViewController {

    //MARK: - конфигуратор мелодии
    func configure() {
        let song = songs[position]
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")

        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true,
                                                          options: .notifyOthersOnDeactivation)
            guard let urlString = urlString
            else { return }

            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)

            guard let player = player
            else { return }

            self.timeSlider.maximumValue = Float(player.duration)

            timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(changedSliderValueFollowingPlayerCurrentTime),
                                         userInfo: nil,
                                         repeats: true)
        }
        catch {
            print("error")
        }
    }



    //MARK: - активация слайдера(привязка ко времени проигрывания)
    func sliderAction() {
        timeSlider.addTarget(self, action: #selector(changedValue(_:)), for: .valueChanged)
    }

    @objc private func changedValue(_ sender: UISlider) {
        if sender == timeSlider {
            self.player?.currentTime = TimeInterval(sender.value)
        }
    }

    //MARK: - перемотка слайдером
    @objc private func changedSliderValueFollowingPlayerCurrentTime() {
        guard let player = player
        else { return }

        let currentValue = Float(player.currentTime)
        timeSlider.value = currentValue

        timePassed.text = "\(timeString(time: Double(timeSlider.value)))"

        let left = Double(timeSlider.maximumValue) - Double(timeSlider.value)
        timeLeft.text = "-\(timeString(time: left))"
    }

    //MARK: - преобразование времени из секунд, в минуты и секунды
    private func timeString(time: TimeInterval) -> String {
        let minute = Int(time) / 60 % 60
        let second = Int(time) % 60

        return String(format: "%01i:%02i", minute, second)
    }



    //MARK: - изменение громкости мелодии
    func sliderVolumeAction() {
        volumeSlider.addTarget(self, action: #selector(changedVolume(_:)), for: .valueChanged)
    }

    @objc private func changedVolume(_ slider: UISlider) {
        guard let player = player
        else { return }

        let value = slider.value
        player.volume = value
        Singleton.shared.sliderValue = value

    }



    //MARK: - обработка нажатия play
    func playAction() {
        playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
    }

    @objc private func didTapPlayPauseButton() {
        player?.volume = Singleton.shared.sliderValue

        guard let player = player
        else { return }

        if player.isPlaying {
            let image = UIImage(systemName: Singleton.ImageNameOfPlayerButton.playButton.rawValue)
            let sizedImage = image?.imageResized(to: CGSize(width: Singleton.BigButton.widthWidth.rawValue,
                                                            height: Singleton.BigButton.widthWidth.rawValue))
            playPauseButton.setImage(sizedImage, for: .normal)
            playPauseButton.alpha = Singleton.PlayerAlfa.playPauseHidden.rawValue

            player.pause()

        } else {
            changeImageFromPlayToPause()
        }
    }

    //MARK: - меняю картинку кнопки с play на pause. Применяю в обработке нажатия на кнопки: play, forward, backward
    private func changeImageFromPlayToPause() {
        guard let player = player
        else { return }
        let image = UIImage(systemName: Singleton.ImageNameOfPlayerButton.pauseButton.rawValue)
        let sizedImage = image?.imageResized(to: CGSize(width: Singleton.BigButton.widthWidth.rawValue,
                                                        height: Singleton.BigButton.widthWidth.rawValue))
        playPauseButton.setImage(sizedImage, for: .normal)
        playPauseButton.alpha = Singleton.PlayerAlfa.playPause.rawValue

        player.play()
    }



    //MARK: - обработка нажатия Backward
    func tapBackwardButton() {
        backwardButton.addTarget(self, action: #selector(didTapBackwardButton), for: .touchUpInside)
    }

    @objc private func didTapBackwardButton() {
        if position > 0 {
            position = position - 1
            player?.stop()

            configureChangedTrack()
        }
    }



    //MARK: - обработка нажатия Forward
    func tapForwardButton() {
        forwardButton.addTarget(self, action: #selector(didTapforwardButton), for: .touchUpInside)
    }

    @objc private func didTapforwardButton() {
        if position < (songs.count - 1) {
            position = position + 1
            player?.stop()

            configureChangedTrack()
        }
    }




    //MARK: - заполнение элементов на новой view после смены трека
    private func fillTrackAfterBackwardOrForward() {
        volumeSlider.value = Singleton.shared.sliderValue
        player?.volume = Singleton.shared.sliderValue

        albumHeadName.text = songs[position].albumName
        trackName.text = songs[position].trackName
        authorName.text = songs[position].authorName
        albumImage.image = UIImage(named: songs[position].albumImage)
    }

    //MARK: - конфигуратор для отображения новой view после смены трека
    private func configureChangedTrack() {
        configure()
        fillTrackAfterBackwardOrForward()
        player?.play()
        changeImageFromPlayToPause()
    }



    //MARK: - обработка нажатия кнопки скрыть экран
    func closeScreen() {
        leftHeadButton.addTarget(self, action: #selector(closePlayer), for: .touchUpInside)
    }

    @objc private func closePlayer() {
        self.dismiss(animated: true)
    }



    //MARK: - обработка нажатия кнопки поделиться
    func sharedButtonAction() {
        sharedHeadButton.addTarget(self, action: #selector(sharedAction), for: .touchUpInside)

    }

    @objc private func sharedAction() {
        let imageName = songs[position].albumImage
        let image = UIImage(named: imageName)

        guard let image = image
        else { return }

        let item: [Any] = [songs[position].albumName, image]

        let avc = UIActivityViewController(activityItems: item, applicationActivities: nil)
        present(avc, animated: true)
    }
}


