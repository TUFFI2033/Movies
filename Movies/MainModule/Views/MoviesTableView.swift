//
//  MoviesTableView.swift
//  Movies
//
//  Created by Ivan Byndiu on 18/11/2023.
//

import UIKit

class MoviesTableView: UITableView {
    
    var moviesData: [MoviesModel.Result] = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
        setDelegate()
        register(MoviesTableViewCell.self, forCellReuseIdentifier: MoviesTableViewCell.reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .clear
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setDelegate() {
        delegate = self
        dataSource = self
    }
}

//MARK: UITableViewDataSource

extension MoviesTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.reuseIdentifier, for: indexPath) as? MoviesTableViewCell else {
            return UITableViewCell()
        }
        
        cell.updateLabels(model: moviesData, indexPath: indexPath)
        return cell
    }
}

//MARK: UITableViewDelegate

extension MoviesTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
}
