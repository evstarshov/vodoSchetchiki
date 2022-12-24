//
//  MainTabBarController.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import UIKit

enum TabBarPage {
    case statistics
    case main
    case settings

    init?(index: Int) {
        switch index {
        case 0:
            self = .statistics
        case 1:
            self = .main
        case 2:
            self = .settings
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .statistics:
            return "Статистика"
        case .main:
            return "Показания"
        case .settings:
            return "Настройки"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .statistics:
            return 0
        case .main:
            return 1
        case .settings:
            return 2
        }
    }
    
    func pageTitleImage() -> UIImage {
        switch self {
        case .statistics:
            return UIImage(systemName: "person.fill") ?? UIImage()
        case .main:
            return UIImage(systemName: "house.fill") ?? UIImage()
        case .settings:
            return UIImage(systemName: "slider.horizontal.3") ?? UIImage()
            
        }
    }
}


/// Deprecated

//class MainTabBarController: UITabBarController {
//
//    //MARK: - Properties
//
//    var coordinator: Coordinator?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        generateTabBar()
//        //setTabBarAppearance()
//        delegate = self
//    }
//
//    //MARK: - Privete function
//
//    private func generateTabBar() {
//        viewControllers = [
//            genereteViewControllers(viewCOntroller: StatisticsViewController(),
//                                    title: "Статистика",
//                                    image: UIImage(systemName: "person.fill")),
//            genereteViewControllers(viewCOntroller: MainViewController(),
//                                    title: "Показания",
//                                    image: UIImage(systemName: "house.fill")),
//            genereteViewControllers(viewCOntroller: SettingsViewController(),
//                                    title: "Настройки",
//                                    image: UIImage(systemName: "slider.horizontal.3"))
//        ]
//    }
//
//    private func genereteViewControllers(viewCOntroller: UIViewController, title: String, image: UIImage?) -> UIViewController {
//        viewCOntroller.tabBarItem.title = title
//        viewCOntroller.tabBarItem.image = image
//        return viewCOntroller
//    }
//
//
//}
//
//// MARK: Extension
//
//extension MainTabBarController: UITabBarControllerDelegate  {
//
//       @objc func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        guard let tabViewControllers = tabBarController.viewControllers,
//              let toIndex = tabViewControllers.firstIndex(of: viewController)
//        else {
//            return false
//        }
//        animateToTab(toIndex: toIndex)
//        return true
//    }
//
//    func animateToTab(toIndex: Int) {
//        guard let tabViewControllers = viewControllers,
//              let selectedVC = selectedViewController else { return }
//
//        guard let fromView = selectedVC.view,
//              let toView = tabViewControllers[toIndex].view,
//              let fromIndex = tabViewControllers.firstIndex(of: selectedVC),
//              fromIndex != toIndex else { return }
//
//        fromView.superview?.addSubview(toView)
//
//        let screenWidth = UIScreen.main.bounds.size.width
//        let scrollRight = toIndex > fromIndex
//        let offset = (scrollRight ? screenWidth : -screenWidth)
//        toView.center = CGPoint(x: fromView.center.x + offset, y: toView.center.y)
//
//        view.isUserInteractionEnabled = false
//
//        UIView.animate(withDuration: 0.45,
//                       delay: 0.0,
//                       usingSpringWithDamping: 1,
//                       initialSpringVelocity: 0,
//                       options: .curveEaseOut,
//                       animations: {
//                        fromView.center = CGPoint(x: fromView.center.x - offset, y: fromView.center.y)
//                        toView.center = CGPoint(x: toView.center.x - offset, y: toView.center.y)
//
//                       }, completion: { finished in
//                        fromView.removeFromSuperview()
//                        self.selectedIndex = toIndex
//                        self.view.isUserInteractionEnabled = true
//                       })
//    }
//
//}
