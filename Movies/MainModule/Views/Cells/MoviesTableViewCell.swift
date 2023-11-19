//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by Ivan Byndiu on 18/11/2023.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    static let idCalendarCell = "idCalendarCell"
    
    private let selectBackgroundView = UIView()
    
    private let moviesImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "joker")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 20
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let nameMoviesLabel = UILabel(text: "Title",
                                          font: .robotoBold18())
    private let descriptionMoviesLabel = UILabel(text: "Year,\nCountry,\nCategory,\nTime ",
                                                 font: .robotoMedium12(),
                                                 textColor: .specialGray)
    private lazy var stackLabel = UIStackView(arrangedSubviews: [nameMoviesLabel, descriptionMoviesLabel], axis: .vertical, spacing: 5)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        layer.cornerRadius = 25
        selectBackgroundView.backgroundColor = .specialRed
        selectBackgroundView.layer.cornerRadius = 25
        selectedBackgroundView = selectBackgroundView
        descriptionMoviesLabel.numberOfLines = 0
        
        addSubview(moviesImage)
        addSubview(stackLabel)
    }
    
    func updateLabels(model: MoviesModel) {
        nameMoviesLabel.text = model.title
        descriptionMoviesLabel.text = """
Released: \(model.released)
Country: \(model.country)
Genre: \(model.genre)
Time: \(model.runtime)
"""
    }
}

// MARK: Set Constraints

extension MoviesTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            moviesImage.widthAnchor.constraint(equalToConstant: 130),
            moviesImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            moviesImage.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            moviesImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            stackLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackLabel.leadingAnchor.constraint(equalTo: moviesImage.trailingAnchor, constant: 15),
            stackLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
        ])
    }
}
