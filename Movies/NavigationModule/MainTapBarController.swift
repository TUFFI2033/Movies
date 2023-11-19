//
//  MainTapBarController.swift
//  Movies
//
//  Created by Ivan Byndiu on 12/11/2023.
//

import UIKit

class MainTapBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupItems()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .specialGray
    }
    
    private func setupItems() {
        let mainVC = MainViewController()
        let searchVC = SearchViewController()
        let favoriteVC = FavoriteViewCotroller()
        
        setViewControllers([mainVC, searchVC,favoriteVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Home"
        items[1].title = "Search"
        items[2].title = "Favorite"
        
        items[0].image = UIImage(named: "Home")
        items[1].image = UIImage(named: "search")
        items[2].image = UIImage(named: "favorite")
        
        UITabBarItem.appearance().setBadgeTextAttributes([.font : UIFont.robotoBold12() as Any], for: .normal)
    }
}
