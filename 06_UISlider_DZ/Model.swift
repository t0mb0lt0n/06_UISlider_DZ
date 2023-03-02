//
//  Model.swift
//  06_UISlider_DZ
//
//  Created by Alexander on 16.02.2023.
//

import Foundation
import AVFoundation
import UIKit

let pathOne = Bundle.main.path(forResource: "Timati_Mario_Winans", ofType: "mp3")
let pathTwo = Bundle.main.path(forResource: "Decl", ofType: "mp3")
let imageOne = UIImage(named: "trackOne_Logo")
let imageTwo = UIImage(named: "trackTwo_Logo")

struct Storage {
    var audioPaths: [String] = [pathOne ?? noFileErrMSG, pathTwo ?? noFileErrMSG]
    var albumPics: [UIImage?] = [imageOne, imageTwo]
    let trackNames: [String] = ["Frvr", "Letter" ]
    let albumNames: [String] = ["Mario winans", "Decl"]
    static let noFileErrMSG: String = "no file in such directory"
    
    //MARK: - add track to storage
    mutating func addTrackIntoStorage(track: String) {
        self.audioPaths.append(track)
        print(audioPaths.count)
    }
}

struct AudioFile {
    let trackName: String = "Unknown"
    let audioPath: String
    
    init(audioPath: String) {
        self.audioPath = audioPath
    }
}

let trackOne = AudioFile(audioPath: pathOne ?? "not found")
let trackTwo = AudioFile(audioPath: pathTwo ?? "not found")



