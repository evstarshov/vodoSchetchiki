//
//  MainTabBarController.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        viewControllers = [
            
            genereteViewControllers(viewCOntroller: StatisticsViewController(),
                                    title: "Статистика",
                                    image: UIImage(systemName: "person.fill")),
            genereteViewControllers(viewCOntroller: MainViewController(),
                                    title: "Показания",
                                    image: UIImage(systemName: "house.fill")),
            genereteViewControllers(viewCOntroller: SettingsViewController(),
                                    title: "Настройки",
                                    image: UIImage(systemName: "slider.horizontal.3"))
        ]
    }
    
    private func genereteViewControllers(viewCOntroller: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewCOntroller.tabBarItem.title = title
        viewCOntroller.tabBarItem.image = image
        return viewCOntroller
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 7
        let weight = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(x: positionOnX,
                                y: tabBar.bounds.minY - positionOnY,
                                width: weight,
                                height: height)
            , cornerRadius: height / 5)
        
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = weight / 5
        tabBar.itemPositioning = .automatic
        
        roundLayer.fillColor = UIColor.mainColor.cgColor
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}

