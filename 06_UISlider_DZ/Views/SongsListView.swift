//
//  SongsListView.swift
//  06_UISlider_DZ
//
//  Created by Alexander on 13.02.2023.
//

import UIKit

class SongsListView: UIView {
    private static let lightBlue = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)

//MARK: - trackOne
    let songImageOne: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        let artistImage = UIImage(named: "trackOne_Logo")
        imageView.image = artistImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let trackOneName: UILabel = {
        let label = UILabel()
        label.text = "Unknown Track"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    
    let albumOneName: UILabel = {
        let label = UILabel()
        label.text = "Unknown Track"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        return label
    }()

    let durationLabelOne: UILabel = {
        let label = UILabel()
        label.text = "04:35"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .right
        return label
    }()
    
    let underlineTrackOne: UIView = {
        let underline = UIView(frame: .zero)
        underline.backgroundColor = .lightGray
        return underline
    }()
    
    let trackOneButton: UIButton = {
        let button = UIButton()
        button.tag = 0
        return button
    }()
    
    let trackTwoButton: UIButton = {
        let button = UIButton()
        button.tag = 1
        return button
    }()
    
//MARK: - trackTwo

    let songImageTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        let artistImage = UIImage(named: "trackTwo_Logo")
        imageView.image = artistImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let trackTwoName: UILabel = {
        let label = UILabel()
        label.text = "Unknown Track"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    
    let albumTwoName: UILabel = {
        let label = UILabel()
        label.text = "Unknown Track"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        return label
    }()

    
    let durationLabelTwo: UILabel = {
        let label = UILabel()
        label.text = "04:25"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .right
        return label
    }()

    let underlineTrackTwo: UIView = {
        let underline = UIView(frame: .zero)
        underline.backgroundColor = .lightGray
        return underline
    }()
    
//MARK: - closures
    var trackOneButtonPressedClosure: (() -> Void)?
    var trackTwoButtonPressedClosure: (() -> Void)?

//MARK: - init
    init() {
        super .init(frame: .zero)
        setupView()
        setupConstraints()
    }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

//MARK: - extensions
extension SongsListView {
    
    func setupView() {
        backgroundColor = .white
        let subViews: [UIView] = [songImageOne,
                                  trackOneName,
                                  underlineTrackOne,
                                  durationLabelOne,
                                  trackOneButton,
                                  songImageTwo,
                                  trackTwoName,
                                  underlineTrackTwo,
                                  durationLabelTwo,
                                  trackTwoButton,
                                  albumTwoName,
                                  albumOneName]
                
        for subView in subViews {
            subView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(subView)
            print(subView)
        }
//MARK: - button targets
        trackOneButton.addTarget(self, action: #selector(trackOneButtonPressed), for: .touchUpInside)
        trackTwoButton.addTarget(self, action: #selector(trackTwoButtonPressed), for: .touchUpInside)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            underlineTrackOne.topAnchor.constraint(equalTo: songImageOne.bottomAnchor, constant: 10),
            underlineTrackOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            underlineTrackOne.trailingAnchor.constraint(equalTo: trailingAnchor),
            underlineTrackOne.heightAnchor.constraint(equalToConstant: 1),
            songImageOne.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            songImageOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            songImageOne.widthAnchor.constraint(equalToConstant: 50),
            songImageOne.heightAnchor.constraint(equalToConstant: 50),
            trackOneName.topAnchor.constraint(equalTo: songImageOne.topAnchor, constant: 5),
            trackOneName.leadingAnchor.constraint(equalTo: songImageOne.trailingAnchor, constant: 15),
            trackOneName.widthAnchor.constraint(equalToConstant: 200),
            trackOneName.heightAnchor.constraint(equalToConstant: 20),
            albumOneName.topAnchor.constraint(equalTo: trackOneName.bottomAnchor, constant: 0),
            albumOneName.leadingAnchor.constraint(equalTo: songImageOne.trailingAnchor, constant: 15),
            albumOneName.widthAnchor.constraint(equalToConstant: 200),
            albumOneName.heightAnchor.constraint(equalToConstant: 20),
            durationLabelOne.centerYAnchor.constraint(equalTo: songImageOne.centerYAnchor),
            durationLabelOne.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            durationLabelOne.widthAnchor.constraint(equalToConstant: 41),
            durationLabelOne.heightAnchor.constraint(equalToConstant: 15),
            trackOneButton.leadingAnchor.constraint(equalTo: songImageOne.trailingAnchor, constant: 10),
            trackOneButton.trailingAnchor.constraint(equalTo: trackOneName.trailingAnchor),
            trackOneButton.topAnchor.constraint(equalTo: songImageOne.topAnchor),
            trackOneButton.heightAnchor.constraint(equalToConstant: 50),
            //Track two views
            underlineTrackTwo.topAnchor.constraint(equalTo: songImageTwo.bottomAnchor, constant: 15),
            underlineTrackTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            underlineTrackTwo.trailingAnchor.constraint(equalTo: trailingAnchor),
            underlineTrackTwo.heightAnchor.constraint(equalToConstant: 1),
            songImageTwo.topAnchor.constraint(equalTo: underlineTrackOne.bottomAnchor, constant: 10),
            songImageTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            songImageTwo.widthAnchor.constraint(equalToConstant: 50),
            songImageTwo.heightAnchor.constraint(equalToConstant: 50),
            trackTwoName.topAnchor.constraint(equalTo: songImageTwo.topAnchor, constant: 5),
            trackTwoName.leadingAnchor.constraint(equalTo: songImageTwo.trailingAnchor, constant: 15),
            trackTwoName.widthAnchor.constraint(equalToConstant: 200),
            trackTwoName.heightAnchor.constraint(equalToConstant: 20),
            albumTwoName.topAnchor.constraint(equalTo: trackTwoName.bottomAnchor, constant: 0),
            albumTwoName.leadingAnchor.constraint(equalTo: songImageTwo.trailingAnchor, constant: 15),
            albumTwoName.widthAnchor.constraint(equalToConstant: 200),
            albumTwoName.heightAnchor.constraint(equalToConstant: 20),
            durationLabelTwo.centerYAnchor.constraint(equalTo: songImageTwo.centerYAnchor),
            durationLabelTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            durationLabelTwo.widthAnchor.constraint(equalToConstant: 41),
            durationLabelTwo.heightAnchor.constraint(equalToConstant: 15),
            trackTwoButton.leadingAnchor.constraint(equalTo: songImageTwo.trailingAnchor, constant: 10),
            trackTwoButton.trailingAnchor.constraint(equalTo: trackTwoName.trailingAnchor),
            trackTwoButton.topAnchor.constraint(equalTo: songImageTwo.topAnchor),
            trackTwoButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
//MARK: - Handlers
    @objc func trackOneButtonPressed() {
        trackOneButtonPressedClosure?()
    }
    
    @objc func trackTwoButtonPressed() {
        trackTwoButtonPressedClosure?()
    }
}
