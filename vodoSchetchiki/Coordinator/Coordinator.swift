//
//  Coordinator.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import Foundation
import UIKit
import FlagPhoneNumber

class Coordinator {
    
    // MARK: - Properies
    
    internal var parentController: AppCoordinator?
    internal var navigation: UINavigationController
    
    
    
    // MARK: - Init
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
}

// MARK: - Extention

extension Coordinator: AppCoordinator {
    
    //MARK: - Public functions
    
    public func start() {
        goAuthController()
    }

    /// Этот метод лишний. Зачем ты в двух разных методах создаешь вью и контроллер два раза?
//    public func goVerificationView(verificationID: String) {
///        let vc = VerificationViewController() -- Этот контроллер и контроллер в строке 65 два разных объекта! Это не одно и тоже, они имеют разные ссылки в памяти. Их вью тоже разные объекты, создав контроллер, в него же нужно передать вью. Один объект должен содержать другой. Когда мы совершаем переход, мы создаем один контроллер и потом работаем только с ним. Если ты хочешь продолжать с ним работать, тебе нужно позаботатиться о том где этот объект хранить и как получать к нему доступ.  По строчке здесь ты всего лишь создаешь новый экземпляр этого объекта и тебе нужно сконфигурировать его заново и передавать в нужные места.
//        let view = VerificationView()
//        view.coordinator = self
//        vc.coordinatorDelegate = self
//        vc.verificationView = view
//        navigation.pushViewController(vc, animated: true)
//    }
    
    public func goTabBar(fromVC: VerificationViewController) {
        let tb = MainTabBarController()
        navigation.pushViewController(tb, animated: true)
    }
    
    //MARK: - Private functions
    
    private func goAuthController() {
        let vc = AuthViewController()
        let view = AuthView()
        view.coordinator = self
        vc.coordinatorDelegate = self
        vc.authView = view
        navigation.pushViewController(vc, animated: true)
    }
    
    private func goToVerification(fromVC: AuthViewController, verificationID: String) {
        let vc = VerificationViewController()
        let view = VerificationView()
        vc.verificationView = view
        vc.verificationView?.verificationID = verificationID
        vc.modalPresentationStyle = .currentContext
        vc.coordinatorDelegate = self
        navigation.pushViewController(vc, animated: true)
    }
}


extension Coordinator: VerificationViewDelegate {
    
    func goToMain(from: VerificationViewController) {
        goTabBar(fromVC: from)
    }
    
    
}


extension Coordinator: AuthViewControllerDelegate {
    
    func showVerificationView(from: AuthViewController, verificationID: String) {
        goToVerification(fromVC: from, verificationID: verificationID)
    }
}
