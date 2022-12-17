//
//  MainTabBarController.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    //MARK: - Properties
    
    var coordinator: Coordinator?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
        delegate = self
    }
    
    //MARK: - Privete function
    
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
        let app = UITabBarAppearance()
        app.backgroundEffect = .none
        app.shadowColor = .clear
        tabBar.standardAppearance = app

        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 7
        let weight = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        let cgRect = CGRect(x: positionOnX,
                            y: tabBar.bounds.minY - positionOnY,
                            width: weight,
                            height: height)
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(roundedRect: cgRect, cornerRadius: height / 5)

        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = weight / 5
        tabBar.itemPositioning = .automatic

        roundLayer.fillColor = UIColor.mainColor.cgColor
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = UIColor.tabBarItemLight
        
    }
}

// MARK: Extension

extension MainTabBarController: UITabBarControllerDelegate  {

       @objc func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let tabViewControllers = tabBarController.viewControllers,
              let toIndex = tabViewControllers.firstIndex(of: viewController)
        else {
            return false
        }
        animateToTab(toIndex: toIndex)
        return true
    }

    func animateToTab(toIndex: Int) {
        guard let tabViewControllers = viewControllers,
              let selectedVC = selectedViewController else { return }

        guard let fromView = selectedVC.view,
              let toView = tabViewControllers[toIndex].view,
              let fromIndex = tabViewControllers.firstIndex(of: selectedVC),
              fromIndex != toIndex else { return }

        fromView.superview?.addSubview(toView)

        let screenWidth = UIScreen.main.bounds.size.width
        let scrollRight = toIndex > fromIndex
        let offset = (scrollRight ? screenWidth : -screenWidth)
        toView.center = CGPoint(x: fromView.center.x + offset, y: toView.center.y)

        view.isUserInteractionEnabled = false

        UIView.animate(withDuration: 0.45,
                       delay: 0.0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: {
                        fromView.center = CGPoint(x: fromView.center.x - offset, y: fromView.center.y)
                        toView.center = CGPoint(x: toView.center.x - offset, y: toView.center.y)

                       }, completion: { finished in
                        fromView.removeFromSuperview()
                        self.selectedIndex = toIndex
                        self.view.isUserInteractionEnabled = true
                       })
    }

}
