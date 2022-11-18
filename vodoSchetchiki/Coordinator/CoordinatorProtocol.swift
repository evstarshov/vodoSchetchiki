//
//  CoordinatorProtocol.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import Foundation
import UIKit


protocol AppCoordinator {
    var parentController: AppCoordinator? { get set }
    var navigation: UINavigationController { get set }
    func start()
}
