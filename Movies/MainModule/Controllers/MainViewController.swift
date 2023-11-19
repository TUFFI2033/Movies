//
//  ViewController.swift
//  Movies
//
//  Created by Ivan Byndiu on 12/11/2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private let logoView = LogoView()
    private let genreSelectionView = GenreSelectionView()
    private let moviesTableView = MoviesTableView()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getMovies()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        moviesTableView.delegate = self
        
        view.addSubview(logoView)
        view.addSubview(genreSelectionView)
        view.addSubview(moviesTableView)
    }
    
    func getMovies() {
            NetworkDataFetch.shared.fetchMovies { [weak self] result, error in
                guard let self = self else { return }

                if let model = result {
                    print(model)
                    moviesTableView.moviesData = [model]
                    DispatchQueue.main.async {
                        self.moviesTableView.reloadData()
                    }
                }

                if let error {
                    print(error)
                }
            }
        }
}

//MARK: UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let moviesVC = MoviesViewController()
        moviesVC.modalPresentationStyle = .fullScreen
        present(moviesVC, animated: true)
    }
}

//MARK: Set Constraints

extension MainViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            logoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            logoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            logoView.heightAnchor.constraint(equalToConstant: 45),
            
            genreSelectionView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 20),
            genreSelectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            genreSelectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            genreSelectionView.heightAnchor.constraint(equalToConstant: 30),
            
            moviesTableView.topAnchor.constraint(equalTo: genreSelectionView.bottomAnchor, constant: 20),
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
