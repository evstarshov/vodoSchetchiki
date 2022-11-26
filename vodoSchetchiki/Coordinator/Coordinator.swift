//
//  Coordinator.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import Foundation
import UIKit

class Coordinator {
    
    // MARK: - Properies
    // TODO: указать модификаторы доступа (отсортировать публичные и приватные методы и свойства)
    internal var parentController: AppCoordinator?
    internal var navigation: UINavigationController
    
    // MARK: - Init
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
}


    // MARK: - AppCoordinator protocol
extension Coordinator: AppCoordinator {
    
    // TODO: указать модификатор
   public func start() {
        
    }

}
