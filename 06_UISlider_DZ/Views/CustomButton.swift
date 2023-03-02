//
//  CustomButton.swift
//  06_UISlider_DZ
//
//  Created by Alexander on 15.02.2023.
//

import UIKit

class CustomButton: UIButton {
    let normalGray = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 0.1967226404)
    let pressedGray = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 0.09552406778)
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = pressedGray
            } else {
                backgroundColor = normalGray
            }
        }
    }
}
