//
//  UILabel + Extensions.swift
//  Movies
//
//  Created by Ivan Byndiu on 12/11/2023.
//

import UIKit

extension UILabel {
    convenience init(text: String = "", font: UIFont?, textColor: UIColor = .white) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
