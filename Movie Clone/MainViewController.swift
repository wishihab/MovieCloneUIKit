//
//  ViewController.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 23/09/22.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let berandaView = UINavigationController(rootViewController: BerandaViewController())
        let bioskopView = UINavigationController(rootViewController: BioskopViewController())
        let tiketView = UINavigationController(rootViewController: TiketViewController())
        
        berandaView.tabBarItem.image = UIImage(systemName: "house.fill")
        bioskopView.tabBarItem.image = UIImage(systemName: "building.2.fill")
        tiketView.tabBarItem.image = UIImage(systemName: "ticket.fill")
        
        berandaView.title = "Beranda"
        bioskopView.title = "Bioskop"
        tiketView.title = "Tiket"
        
        tabBar.tintColor = .label
        setViewControllers([berandaView, bioskopView, tiketView], animated: true)
    }


}

