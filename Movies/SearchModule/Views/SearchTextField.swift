//
//  SearchTextField.swift
//  Movies
//
//  Created by Ivan Byndiu on 18/11/2023.
//

import UIKit

class SearchTextField: UITextField {
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "search")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .specialTextGrayTextField
        image.contentMode = .center
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.specialTextGrayTextField
                ]
        
        attributedPlaceholder = NSAttributedString(string: "Search movie...", attributes: placeholderAttributes)
        
        backgroundColor = .specialGrayTextField
        layer.cornerRadius = 20
        font = .robotoBold18()
        textColor = .white
        leftView = imageView
        leftViewMode = .always
        clearButtonMode = .always
        returnKeyType = .done
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 25),
            imageView.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
}
