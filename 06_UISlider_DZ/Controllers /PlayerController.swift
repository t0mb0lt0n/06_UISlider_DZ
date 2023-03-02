//
//  PlayerController.swift
//  06_UISlider_DZ
//
//  Created by Alexander on 14.02.2023.
//

import UIKit
import AVFoundation

class PlayerController: UIViewController {
    lazy var mainView = view as? PlayerView
    var player = AVAudioPlayer()
    private var storage = Storage()
    var trackPosition: Int = 0
    private lazy var timer = Timer()
    var timerRepeats = 0

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainView?.startTimeLabel.text = trackRealTime()
        mainView?.endTimeLabel.text = "-" + remainTrackTime()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //generate view
        view = PlayerView()
        //sent funcs in closures
        mainView?.playPauseButtonClosure = { [weak self] in 
            self?.playPauseButtonPressed()
        }
        mainView?.startButtonPressedClosure = { [weak self] in
            self?.startButtonPressed()
        }
        mainView?.endButtonPressedClosere = { [weak self] in
            self?.endButtonPressed()
        }
        mainView?.closeButtonPressedClosure = { [weak self] in
            self?.closeButtonPressed()
        }
        mainView?.slideSlederClosure = {
            if let sender = self.mainView?.currentTrackTimeSlider {
                self.sliderSlide(sender: sender)
            }
        }
        mainView?.sharebuttonPressedClosure = { [weak self] in
            self?.shareButtonPressed()
        }
        
//MARK: - initializing player
        do {
            let track = storage.audioPaths[trackPosition]
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: track))
            mainView?.currentTrackTimeSlider.maximumValue = Float(player.duration)
            mainView?.currentTrackTimeSlider.minimumValue = 0
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerUpdateValues), userInfo: nil, repeats: true)
            
        } catch {
            print("error")
        }
        player.play()
    }
    
}

//MARK: - extensions 
extension PlayerController {
    private func playPauseButtonPressed() {
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 20)
        let playIcon = UIImage(systemName: "play", withConfiguration: iconConfiguration)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let pauseIcon = UIImage(systemName: "pause", withConfiguration: iconConfiguration)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        guard player.isPlaying  else {
            mainView?.playPauseButton.setImage(playIcon, for: .normal)
            mainView?.imageView.image = storage.albumPics[trackPosition]
            mainView?.playingFromLabel.text = storage.albumNames[trackPosition]
            mainView?.albumNameLabel.text = storage.trackNames[trackPosition]
            mainView?.currentAlbumLabel.text! = "Playing album: " + storage.albumNames[trackPosition]
            mainView?.currentTrackNameLabel.text = storage.trackNames[trackPosition]
            player.play()
            return
        }
        mainView?.playPauseButton.setImage(pauseIcon, for: .normal)
        player.pause()
    }
    
    private func startButtonPressed() {
        trackPosition -= 1
        if trackPosition < 0 {
            trackPosition = 1
        } else if trackPosition > 1 {
            trackPosition = 1
        }
        print("touced", trackPosition)
        let track = storage.audioPaths[trackPosition]
        try! player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: track))
        mainView?.imageView.image = storage.albumPics[trackPosition]
        mainView?.imageView.image = storage.albumPics[trackPosition]
        mainView?.playingFromLabel.text = storage.albumNames[trackPosition]
        mainView?.albumNameLabel.text = storage.trackNames[trackPosition]
        mainView?.currentAlbumLabel.text! = "Playing album: " + storage.albumNames[trackPosition]
        mainView?.currentTrackNameLabel.text = storage.trackNames[trackPosition]
        player.play()
    }
    
    private func endButtonPressed() {
        trackPosition += 1
        if trackPosition < 0 {
            trackPosition = 1
        } else if trackPosition > 1 {
            trackPosition = 0
        }
        let track = storage.audioPaths[trackPosition]
        try! player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: track))
        mainView?.imageView.image = storage.albumPics[trackPosition]
        mainView?.playingFromLabel.text = storage.albumNames[trackPosition]
        mainView?.albumNameLabel.text = storage.trackNames[trackPosition]
        mainView?.currentAlbumLabel.text! = "Playing album: " + storage.albumNames[trackPosition]
        mainView?.currentTrackNameLabel.text = storage.trackNames[trackPosition]
        player.play()
    }
    
    //MARK: -time operations
    // duration time
    func trackRealTime() -> String {
        //converting time
        let realTime = player.currentTime
        let minutes = Int(realTime/60)
        let seconds = Int(realTime.truncatingRemainder(dividingBy: 60))
        let convertedTime = String(format: "%02d:%02d", minutes, seconds)
        return convertedTime
    }
    
    // remainig track time
    func remainTrackTime() -> String {
        //converting time
        let remainTime = player.duration - player.currentTime
        let minutes = Int(remainTime / 60)
        let seconds = Int(remainTime.truncatingRemainder(dividingBy: 60))
        let remainTimeConverted = String(format: "%02d:%02d", minutes, seconds)
        print(remainTimeConverted)
        return remainTimeConverted
    }
    
    //method for timer
    @objc func timerUpdateValues() {
        mainView?.currentTrackTimeSlider.value = Float(player.currentTime)
        mainView?.startTimeLabel.text = trackRealTime()
        mainView?.endTimeLabel.text = "-" + remainTrackTime()
    }
    
//MARK: -Navigation buttons handlers
    func closeButtonPressed() {
        player.stop()
        timer.invalidate()
        dismiss(animated: true, completion: nil)
    }
    
    func shareButtonPressed() {
        let albumImage = UIImage(named: "trackOne_Logo")
        let imageView = UIImageView()
        imageView.image = albumImage
        let activityVC = UIActivityViewController(activityItems: [storage.trackNames.first!], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
    func sliderSlide(sender: UISlider) {
        if sender == mainView?.currentTrackTimeSlider {
            self.player.currentTime = TimeInterval(sender.value)
        }
        print("slided")
    }
}
