//
//  DescriptionView.swift
//  Movies
//
//  Created by Ivan Byndiu on 19/11/2023.
//

import UIKit

class DescriptionView: UIView {
    
    private let moviesNameLabel = UILabel(text: "Title", font: .robotoBold28())
    
    private let yearView = UIView()
    private let yearLabel = UILabel(text: "Year", font: .robotoBold14())
    private let genreView = UIView()
    private let genreLabel = UILabel(text: "Genre", font: .robotoBold14())
    private let timeView = UIView()
    private let timeLabel = UILabel(text: "0h 00m", font: .robotoBold14())
    
    private lazy var stackView = UIStackView(arrangedSubviews: [yearView, genreView, timeView], axis: .horizontal, spacing: 10)
    
    private let descriptionLabel = UILabel(font: .robotoMedium12(), textColor: .specialGray)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        moviesNameLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        
        //set view genre
        yearView.layer.cornerRadius = 15
        genreView.layer.cornerRadius = 15
        timeView.layer.cornerRadius = 15
        yearView.backgroundColor = .specialButtonGray
        genreView.backgroundColor = .specialButtonGray
        timeView.backgroundColor = .specialButtonGray
        yearLabel.textAlignment = .center
        genreLabel.textAlignment = .center
        timeLabel.textAlignment = .center
        stackView.distribution = .fillEqually
        
        addSubview(moviesNameLabel)
        addSubview(stackView)
        addSubview(yearLabel)
        addSubview(genreLabel)
        addSubview(timeLabel)
        addSubview(descriptionLabel)
        
        // Set Constraint
        
        NSLayoutConstraint.activate([
            moviesNameLabel.topAnchor.constraint(equalTo: topAnchor),
            moviesNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            moviesNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: moviesNameLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 30),
            
            yearLabel.centerYAnchor.constraint(equalTo: yearView.centerYAnchor),
            yearLabel.leadingAnchor.constraint(equalTo: yearView.leadingAnchor, constant: 3),
            yearLabel.trailingAnchor.constraint(equalTo: yearView.trailingAnchor, constant: -3),
            
            genreLabel.centerYAnchor.constraint(equalTo: genreView.centerYAnchor),
            genreLabel.leadingAnchor.constraint(equalTo: genreView.leadingAnchor, constant: 3),
            genreLabel.trailingAnchor.constraint(equalTo: genreView.trailingAnchor, constant: -3),
            
            timeLabel.centerYAnchor.constraint(equalTo: timeView.centerYAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: timeView.leadingAnchor, constant: 3),
            timeLabel.trailingAnchor.constraint(equalTo: timeView.trailingAnchor, constant: -3),
            
            descriptionLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func updateLabels(model: [MoviesModel.Result]) {
        let movie = model[0]
        moviesNameLabel.text = movie.title
        yearLabel.text = "Release: \(movie.releaseDate)"
    }
}
