//
//  LogoView.swift
//  Movies
//
//  Created by Ivan Byndiu on 12/11/2023.
//

import UIKit

class LogoView: UIView {
    
    private let logoImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Logo")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let logoLabel = UILabel(text: "Movies", font: .robotoBold36())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(logoImage)
        addSubview(logoLabel)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: topAnchor),
            logoImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 40),
            logoImage.heightAnchor.constraint(equalToConstant: 40),
            
            logoLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor),
            logoLabel.topAnchor.constraint(equalTo: topAnchor)
            
        ])
    }
}
