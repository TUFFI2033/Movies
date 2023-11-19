//
//  SearchViewController.swift
//  Movies
//
//  Created by Ivan Byndiu on 12/11/2023.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let searchTextField = SearchTextField()
    private let findMovieView = FindMovieView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(searchTextField)
        view.addSubview(findMovieView)
    }
}

//MARK: Set Constraints

extension SearchViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            searchTextField.heightAnchor.constraint(equalToConstant: 50),
            
            findMovieView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            findMovieView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            findMovieView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            findMovieView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
