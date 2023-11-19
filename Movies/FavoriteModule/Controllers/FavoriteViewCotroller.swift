//
//  FavoriteViewCotroller.swift
//  Movies
//
//  Created by Ivan Byndiu on 12/11/2023.
//

import UIKit

class FavoriteViewCotroller: UIViewController {
    
    private let logoView = LogoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(logoView)
    }
}

//MARK: Set Constraints

extension FavoriteViewCotroller {
    func setConstraints() {
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            logoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            logoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            logoView.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
}
