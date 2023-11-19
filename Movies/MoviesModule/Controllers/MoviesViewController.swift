//
//  MoviesViewController.swift
//  Movies
//
//  Created by Ivan Byndiu on 12/11/2023.
//

import UIKit

class MoviesViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let playView = PlayView()
    private let descriptionView = DescriptionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        playView.delegate = self
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(playView)
        contentView.addSubview(descriptionView)
    }
}

//MARK: PlayViewProtocol

extension MoviesViewController: PlayViewProtocol {
    func backButtonTapped() {
        dismiss(animated: true)
    }
    
    func favoriteButtonTapped() {
        print("tap favorite")
    }
    
    func playButtonTapped() {
        print("tap play")
    }
}

//MARK: Set Constraints

extension MoviesViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1.5),
            
            playView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -50),
            playView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            playView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            playView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            
            descriptionView.topAnchor.constraint(equalTo: playView.bottomAnchor,constant: 20),
            descriptionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
        ])
    }
}
