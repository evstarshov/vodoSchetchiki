//
//  NotificationName.swift
//  vodoSchetchiki
//
//  Created by Евгений Старшов on 05.12.2022.
//

import Foundation

extension Notification.Name {
    static let notificationFromTButton = Notification.Name(rawValue: "Send")
    static let notificationVerification = Notification.Name(rawValue: "Verification")
    static let notificationTabBar = Notification.Name(rawValue: "TabBar")
    static let notificationLogOut = Notification.Name(rawValue: "GoAuth")
    static let saveUserData = Notification.Name(rawValue: "SaveUserData")


    
}
