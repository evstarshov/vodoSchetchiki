//
//  LoginCoordinator.swift
//  vodoSchetchiki
//
//  Created by Евгений Старшов on 18.12.2022.
//

import Foundation
import UIKit

protocol LoginCoordinatorProtocol: Coordinator {
    func showAuthController()
}

class LoginCoordinator {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType = .login
    
    func start() {
        showAuthController()
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("LoginCoordinator deinit")
    }
}

extension LoginCoordinator {
    private func goToVerification(fromVC: AuthViewController, verificationID: String) {
        let vc = VerificationViewController()
        let view = VerificationView()
        vc.verificationView = view
        vc.verificationView?.verificationID = verificationID
        vc.modalPresentationStyle = .currentContext
        vc.coordinatorDelegate = self
        navigationController.pushViewController(vc, animated: true)
    }
}

extension LoginCoordinator: LoginCoordinatorProtocol {

    func showAuthController() {
        let vc = AuthViewController()
        let view = AuthView()
        vc.coordinatorDelegate = self
        vc.authView = view
        navigationController.pushViewController(vc, animated: true)
    }
}

extension LoginCoordinator: AuthViewControllerDelegate {
    func showTabBarView(from: AuthViewController) {
        finish()
    }
    
    func showVerificationView(from: AuthViewController, verificationID: String) {
        goToVerification(fromVC: from, verificationID: verificationID)
    }
}

extension LoginCoordinator: VerificationViewDelegate {
    
    func goToMain(from: VerificationViewController) {
        self.finish()
    }
}
