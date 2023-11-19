//
//  FindMovieView.swift
//  Movies
//
//  Created by Ivan Byndiu on 18/11/2023.
//

import UIKit

class FindMovieView: UIView {
    
    private let searchImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "searchImg")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let findLabel = UILabel(text: "Find your movie", font: .robotoBold28())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        findLabel.textAlignment = .center
        
        addSubview(searchImageView)
        addSubview(findLabel)
        
        NSLayoutConstraint.activate([
            searchImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            searchImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            searchImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchImageView.topAnchor.constraint(equalTo: topAnchor),
            
            findLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            findLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            findLabel.topAnchor.constraint(equalTo: searchImageView.bottomAnchor, constant: 20)
        ])
    }
}
