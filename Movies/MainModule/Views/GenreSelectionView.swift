//
//  GenreSelectionView.swift
//  Movies
//
//  Created by Ivan Byndiu on 13/11/2023.
//

import UIKit

class GenreSelectionView: UIView {
    
    private let scrollView = UIScrollView()
    
    private let newReleasesButton = UIButton(text: "New Releases", font: .robotoBold14(), backgroundColor: .specialRed)
    private let moviesButton = UIButton(text: "Movies", font: .robotoBold14())
    private let tvSeriesButton = UIButton(text: "TV series", font: .robotoBold14())
    private let cartoonsButton = UIButton(text: "Cartoons", font: .robotoBold14())
    private let animeButton = UIButton(text: "Anime", font: .robotoBold14())
    private lazy var allButtons = [newReleasesButton, moviesButton, tvSeriesButton, cartoonsButton, animeButton]
    
    private lazy var stackButton = UIStackView(
        arrangedSubviews: [newReleasesButton, moviesButton, tvSeriesButton, cartoonsButton, animeButton],
        axis: .horizontal,
        spacing: 10)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        
        newReleasesButton.addTarget(self, action: #selector(newItemsButtonTap), for: .touchUpInside)
        moviesButton.addTarget(self, action: #selector(moviesButtonTap), for: .touchUpInside)
        tvSeriesButton.addTarget(self, action: #selector(tvSeriesButtonTap), for: .touchUpInside)
        cartoonsButton.addTarget(self, action: #selector(cartoonsButtonTap), for: .touchUpInside)
        animeButton.addTarget(self, action: #selector(animeButtonTap), for: .touchUpInside)
        
        addSubview(scrollView)
        scrollView.addSubview(stackButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            stackButton.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 25),
            stackButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -25)
        ])
    }
    
    private func setupButtons() {
        for button in allButtons {
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 30),
                button.widthAnchor.constraint(equalToConstant: 120),
            ])
        }
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        for button in allButtons {
            button.isSelected = false
            button.backgroundColor = .specialButtonGray
        }
        
        sender.isSelected = true
        sender.backgroundColor = .specialRed
    }
    
    @objc private func moviesButtonTap() {
        print(#function)
    }
    
    @objc private func tvSeriesButtonTap() {
        print(#function)
    }
    
    @objc private func cartoonsButtonTap() {
        print(#function)
    }
    
    @objc private func animeButtonTap() {
        print(#function)
    }
    
    @objc private func newItemsButtonTap() {
        print(#function)
    }
}
