//
//  PlayerView.swift
//  06_UISlider_DZ
//
//  Created by Alexander on 14.02.2023.
//

import UIKit

class PlayerView: UIView {
    static let normalBlue = #colorLiteral(red: 0.2423955537, green: 0.6974318635, blue: 1, alpha: 0.4957308607)
    static let normalGray = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 0.1967226404)
    static let minTrackColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    static let maxTrackColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)


    static var playingTrackPic: UIImage?
    
    var playingFromLabel: UILabel = {
        let label = UILabel()
        label.text = "Playing from album"
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    var albumNameLabel: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    var currentAlbumLabel: UILabel = {
        let label = UILabel()
        label.text = "Playing from album"
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    var currentTrackNameLabel: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        return label
    }()

    var shareButton: UIButton = {
        let button = UIButton(type: .system)
        let shareIcon = UIImage(systemName: "square.and.arrow.up")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(shareIcon, for: .normal)
        return button
    }()
    
    var closeButton: UIButton = {
        let button = UIButton(type: .system)
        let closeIcon = UIImage(systemName: "chevron.down")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(closeIcon, for: .normal)
        return button
    }()

    
    let currentTrackTimeSlider: UISlider = {
        let slider = UISlider()
        
        slider.maximumTrackTintColor = PlayerView.minTrackColor
        slider.minimumTrackTintColor = PlayerView.maxTrackColor
        var configurationForSelected = UIImage.SymbolConfiguration(pointSize: 23)
        var configurationForNormal = UIImage.SymbolConfiguration(pointSize: 12)
        let imageForNormal = UIImage(systemName: "circle.fill", withConfiguration: configurationForNormal)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let imageForSelected = UIImage(systemName: "circle.fill", withConfiguration: configurationForSelected)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        slider.setThumbImage(imageForNormal, for: .normal)
        slider.setThumbImage(imageForSelected, for: .highlighted)
        return slider
    }()

    
    var startButton: UIButton = {
        let button = UIButton(type: .system)
        var configurationForNormal = UIImage.SymbolConfiguration(pointSize: 15)
        let startIcon = UIImage(systemName: "backward.end", withConfiguration: configurationForNormal)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(startIcon, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    
    var playPauseButton: UIButton = {
        let button = UIButton(type: .system)
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 20)
        let playPauseIcon = UIImage(systemName: "play", withConfiguration: iconConfiguration)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(playPauseIcon, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
//MARK: -Demo buttons

    var plusButton: UIButton = {
        let button = UIButton(type: .system)
        let iconConfiguration = UIImage.SymbolConfiguration.init(pointSize: 15)
        let plusIcon = UIImage(systemName: "plus", withConfiguration: iconConfiguration)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(plusIcon, for: .normal)
        return button
    }()
    
    var optionButton: UIButton = {
        let button = UIButton(type: .system)
        let iconConfiguration = UIImage.SymbolConfiguration.init(pointSize: 15)
        let optionIcon = UIImage(systemName: "ellipsis", withConfiguration: iconConfiguration)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(optionIcon, for: .normal)
        return button
    }()
    
    var shuffleButton: UIButton = {
        let button = UIButton(type: .system)
        let iconConfiguration = UIImage.SymbolConfiguration.init(pointSize: 30)
        let plusIcon = UIImage(systemName: "shuffle", withConfiguration: iconConfiguration)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(plusIcon, for: .normal)
        return button
    }()
    
    var loopButton: UIButton = {
        let button = UIButton(type: .system)
        let iconConfiguration = UIImage.SymbolConfiguration.init(pointSize: 30)
        let optionIcon = UIImage(systemName: "repeat.1", withConfiguration: iconConfiguration)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(optionIcon, for: .normal)
        return button
    }()

//MARK: -action buttons
    var endButton: UIButton = {
        let button = UIButton(type: .system)
        let iconConfiguration = UIImage.SymbolConfiguration.init(pointSize: 15)
        let endIcon = UIImage(systemName: "forward.end", withConfiguration: iconConfiguration)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(endIcon, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    let startTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    let endTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "-00:00"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        return label
    }()


    //var image = UIImage()
    var imageView = UIImageView(image: PlayerView.playingTrackPic)
    var trackPicView = UIView()
            
    
    init() {
        super .init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - closures for handlers
    var playPauseButtonClosure:    (() -> Void)?
    var sharebuttonPressedClosure: (() -> Void)?
    var startButtonPressedClosure: (() -> Void)?
    var endButtonPressedClosere:   (() -> Void)?
    var closeButtonPressedClosure: (() -> Void)?
    var slideSlederClosure:        (() -> Void)?
}


extension PlayerView {
    
    func setupView() {
        backgroundColor = .white
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        trackPicView.clipsToBounds = false
        trackPicView.layer.shadowOffset = CGSize.zero
        trackPicView.layer.shadowOpacity = 0.7
        trackPicView.layer.shadowRadius = 5
        trackPicView.layer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 10, width: 250, height: 250), cornerRadius: 10).cgPath
        trackPicView.layer.shadowColor = UIColor.black.cgColor

        let createdSubViews: [UIView] = [playPauseButton,
                                         startButton,
                                         endButton,
                                         shareButton,
                                         trackPicView,
                                         imageView,
                                         albumNameLabel,
                                         playingFromLabel,
                                         currentAlbumLabel,
                                         currentTrackNameLabel,
                                         currentTrackTimeSlider,
                                         closeButton,
                                         startTimeLabel,
                                         endTimeLabel,
                                         plusButton,
                                         optionButton,
                                         loopButton,
                                         shuffleButton]
        //  adding subViews
        for subView in createdSubViews {
            subView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(subView)
        }
        //targets for buttons
        playPauseButton.addTarget(self, action: #selector(playPauseButtonPressed), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        endButton.addTarget(self, action: #selector(endButtonPressed), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        currentTrackTimeSlider.addTarget(self, action: #selector(slideSliderSlided), for: .valueChanged)
        shareButton.addTarget(self, action: #selector(shareButtonPressed), for: .touchUpInside)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -57),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 68),
            startButton.widthAnchor.constraint(equalToConstant: 50),
            startButton.heightAnchor.constraint(equalToConstant: 30),
            endButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -57),
            endButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -68),
            endButton.widthAnchor.constraint(equalToConstant: 50),
            endButton.heightAnchor.constraint(equalToConstant: 30),
            shareButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            shareButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            shareButton.widthAnchor.constraint(equalToConstant: 37),
            shareButton.heightAnchor.constraint(equalToConstant: 37),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 55),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            trackPicView.centerXAnchor.constraint(equalTo: centerXAnchor),
            trackPicView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            trackPicView.widthAnchor.constraint(equalToConstant: 250),
            trackPicView.heightAnchor.constraint(equalToConstant: 250),
            playingFromLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            playingFromLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            albumNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            albumNameLabel.topAnchor.constraint(equalTo: playingFromLabel.bottomAnchor, constant: 0),
            currentAlbumLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            currentAlbumLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            currentTrackNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            currentTrackNameLabel.topAnchor.constraint(equalTo: currentAlbumLabel.bottomAnchor, constant: 5),
            currentTrackTimeSlider.centerXAnchor.constraint(equalTo: centerXAnchor),
            currentTrackTimeSlider.topAnchor.constraint(equalTo: currentTrackNameLabel.bottomAnchor, constant: 20),
            currentTrackTimeSlider.widthAnchor.constraint(equalToConstant: 250),
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            closeButton.widthAnchor.constraint(equalToConstant: 37),
            closeButton.heightAnchor.constraint(equalToConstant: 37),
            playPauseButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            playPauseButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            playPauseButton.widthAnchor.constraint(equalToConstant: 70),
            playPauseButton.heightAnchor.constraint(equalToConstant: 45),
            
            startTimeLabel.bottomAnchor.constraint(equalTo: currentTrackTimeSlider.topAnchor, constant: -5),
            startTimeLabel.leadingAnchor.constraint(equalTo: currentTrackTimeSlider.leadingAnchor, constant: -20),
            startTimeLabel.widthAnchor.constraint(equalToConstant: 50),
            startTimeLabel.heightAnchor.constraint(equalToConstant: 15),
            endTimeLabel.bottomAnchor.constraint(equalTo: currentTrackTimeSlider.topAnchor, constant: -5),
            endTimeLabel.trailingAnchor.constraint(equalTo: currentTrackTimeSlider.trailingAnchor, constant: 20),
            endTimeLabel.widthAnchor.constraint(equalToConstant: 50),
            endTimeLabel.heightAnchor.constraint(equalToConstant: 15),
            
            plusButton.topAnchor.constraint(equalTo: currentAlbumLabel.topAnchor),
            plusButton.centerXAnchor.constraint(equalTo: startTimeLabel.centerXAnchor, constant: -7),
            plusButton.widthAnchor.constraint(equalToConstant: 20),
            plusButton.heightAnchor.constraint(equalToConstant: 20),
            optionButton.topAnchor.constraint(equalTo: currentAlbumLabel.topAnchor),
            optionButton.centerXAnchor.constraint(equalTo: endTimeLabel.centerXAnchor, constant: 7),
            optionButton.widthAnchor.constraint(equalToConstant: 20),
            optionButton.heightAnchor.constraint(equalToConstant: 20),
            
            shuffleButton.centerYAnchor.constraint(equalTo: startButton.centerYAnchor),
            shuffleButton.trailingAnchor.constraint(equalTo: startButton.leadingAnchor, constant: -20),
            shuffleButton.widthAnchor.constraint(equalToConstant: 25),
            shuffleButton.heightAnchor.constraint(equalToConstant: 20),
            loopButton.centerYAnchor.constraint(equalTo: endButton.centerYAnchor),
            loopButton.leadingAnchor.constraint(equalTo: endButton.trailingAnchor, constant: 20),
            loopButton.widthAnchor.constraint(equalToConstant: 25),
            loopButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    
//MARK: - Handlers
    @objc func playPauseButtonPressed() {
        playPauseButtonClosure?()
    }
    
    @objc func startButtonPressed() {
        startButtonPressedClosure?()
    }
    
    @objc func endButtonPressed() {
        endButtonPressedClosere?()
    }
    
    @objc func closeButtonPressed() {
        closeButtonPressedClosure?()
    }
    
    @objc func shareButtonPressed() {
        sharebuttonPressedClosure?()
    }
    
    @objc func slideSliderSlided() {
        slideSlederClosure?()
    }
}



