//
//  ViewController.swift
//  06_UISlider_DZ
//
//  Created by Alexander on 13.02.2023.
//

import UIKit

class SongsListController: UIViewController {
    lazy var mainView = view as? SongsListView
    private var storage = Storage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = SongsListView()
        title = "Композиции"
        //send funcs to closures in view
        mainView?.trackOneButtonPressedClosure = { [weak self] in
            self?.trackOneButtonPressed()
        }
        
        mainView?.trackTwoButtonPressedClosure = { [weak self] in
            self?.trackTwoButtonPressed()
        }
        mainView?.trackOneName.text = storage.albumNames.first
        mainView?.albumOneName.text = storage.trackNames.first
        mainView?.trackTwoName.text = storage.albumNames.last
        mainView?.albumTwoName.text = storage.trackNames.last
        //navigationController?.isNavigationBarHidden = true
    }
}

extension SongsListController {
    
    func trackOneButtonPressed() {
        firstLabelUpdate(trackPosition: 0)
    }
    
    func trackTwoButtonPressed() {
        firstLabelUpdate(trackPosition: 1)
    }
    
    //Update all track info views after first playing
    private func firstLabelUpdate(trackPosition: Int) {
        let targetVC = PlayerController()
        targetVC.trackPosition = trackPosition
        PlayerView.playingTrackPic = storage.albumPics[trackPosition]
        targetVC.mainView?.imageView.image = storage.albumPics[trackPosition]
        targetVC.mainView?.playingFromLabel.text = storage.albumNames[trackPosition]
        targetVC.mainView?.albumNameLabel.text = storage.trackNames[trackPosition]
        targetVC.mainView?.currentAlbumLabel.text! = "Playing album: " + storage.albumNames[trackPosition]
        targetVC.mainView?.currentTrackNameLabel.text = storage.trackNames[trackPosition]
        present(targetVC, animated: true)
    }
}
