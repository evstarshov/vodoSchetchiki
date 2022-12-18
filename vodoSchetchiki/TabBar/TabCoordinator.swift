//
//  TabCoordinator.swift
//  vodoSchetchiki
//
//  Created by Евгений Старшов on 18.12.2022.
//

import Foundation
import UIKit

protocol TabCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get set }
    func selectPage(_ page: TabBarPage)
    func setSelectedIndex(_ index: Int)
    func currentPage() -> TabBarPage?
}

class TabCoordinator: NSObject {
    
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType {
        .tab
    }
    
    var tabBarController: UITabBarController
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }
    
}

extension TabCoordinator {
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.delegate = self
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.statistics.pageOrderNumber()
        tabBarController.tabBar.isTranslucent = false
        setTabBarAppearance()
        navigationController.viewControllers = [tabBarController]
        
    }
    
    private func setTabBarAppearance() {
        let app = UITabBarAppearance()
        app.backgroundEffect = .none
        app.shadowColor = .clear
        tabBarController.tabBar.standardAppearance = app

        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 7
        let weight = tabBarController.tabBar.bounds.width - positionOnX * 2
        let height = tabBarController.tabBar.bounds.height + positionOnY * 2
        let cgRect = CGRect(x: positionOnX,
                            y: tabBarController.tabBar.bounds.minY - positionOnY,
                            width: weight,
                            height: height)
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(roundedRect: cgRect, cornerRadius: height / 5)

        roundLayer.path = bezierPath.cgPath
        tabBarController.tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBarController.tabBar.itemWidth = weight / 5
        tabBarController.tabBar.itemPositioning = .automatic

        roundLayer.fillColor = UIColor.mainColor.cgColor
        tabBarController.tabBar.tintColor = .tabBarItemAccent
        tabBarController.tabBar.unselectedItemTintColor = UIColor.tabBarItemLight
        
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)

        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: nil,
                                                     tag: page.pageOrderNumber())
        
        switch page {
        case .statistics:
            let statisticsVC = StatisticsViewController()
            navController.pushViewController(statisticsVC, animated: true)
        case .main:
            let mainVC = MainViewController()
            navController.pushViewController(mainVC, animated: true)
        case .settings:
            let settingsVC = SettingsViewController()
            navController.pushViewController(settingsVC, animated: true)
        }
        
        return navController
    }
    
    func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}

extension TabCoordinator: Coordinator {
    
    func start() {
        let pages: [TabBarPage] = [.statistics, .main, .settings]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        // Initialization of ViewControllers or these pages
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        prepareTabBarController(withTabControllers: controllers)
    }
    
    
}

extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
    }
}
