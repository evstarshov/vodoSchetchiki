//
//  UIViewController+extention.swift
//  vodoSchetchiki
//
//  Created by Mac on 05.12.2022.
//

import UIKit

extension UIViewController {
    
    func errorAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ок", style: .cancel)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
}
