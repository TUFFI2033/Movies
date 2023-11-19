//
//  UIButton + Extensions.swift
//  Movies
//
//  Created by Ivan Byndiu on 13/11/2023.
//

import UIKit

extension UIButton {
    convenience init(text: String = "", font: UIFont?, textColor: UIColor = .white, backgroundColor: UIColor = .specialButtonGray) {
        self.init()
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = font
        self.tintColor = textColor
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 15
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(backgroundColor: UIColor?, image: UIImage?) {
        self.init()
        self.setImage(image, for: .normal)
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
