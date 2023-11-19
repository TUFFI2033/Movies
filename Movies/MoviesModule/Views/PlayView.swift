//
//  PlayView.swift
//  Movies
//
//  Created by Ivan Byndiu on 18/11/2023.
//

import UIKit

protocol PlayViewProtocol: AnyObject {
    func backButtonTapped()
    func favoriteButtonTapped()
    func playButtonTapped()
}

class PlayView: UIView {
    
    weak var delegate: PlayViewProtocol?
    
    private lazy var backButton = UIButton(backgroundColor: .specialBlurButton, image: UIImage(named: "back"))
    private lazy var favoriteButton = UIButton(backgroundColor: .specialBlurButton, image: UIImage(named: "favorite"))
    private lazy var playButton = UIButton(backgroundColor: .specialBlurButton, image: UIImage(named: "play"))
    
    private let moviesImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "thor")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        
        backButton.layer.cornerRadius = 20
        favoriteButton.layer.cornerRadius = 20
        playButton.layer.cornerRadius = 30
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        
        addSubview(moviesImage)
        addSubview(backButton)
        addSubview(favoriteButton)
        addSubview(playButton)
        
        //Set Constraint
        
        NSLayoutConstraint.activate([
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            favoriteButton.heightAnchor.constraint(equalToConstant: 40),
            favoriteButton.widthAnchor.constraint(equalToConstant: 40),
            favoriteButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            playButton.heightAnchor.constraint(equalToConstant: 60),
            playButton.widthAnchor.constraint(equalToConstant: 60),
            playButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            moviesImage.topAnchor.constraint(equalTo: topAnchor),
            moviesImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            moviesImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            moviesImage.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    @objc private func backButtonTapped() {
        delegate?.backButtonTapped()
    }
    
    @objc private func favoriteButtonTapped() {
        delegate?.favoriteButtonTapped()
    }
    
    @objc private func playButtonTapped() {
        delegate?.playButtonTapped()
    }
}
