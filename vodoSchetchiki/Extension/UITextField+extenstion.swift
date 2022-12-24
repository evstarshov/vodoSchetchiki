//
//  UITextField+extention.swift
//  vodoSchetchiki
//
//  Created by Mac on 17.11.2022.
//

import Foundation
import UIKit

extension UITextField {
    
    //MARK: - With the help of this func I indent the textField
    
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}



