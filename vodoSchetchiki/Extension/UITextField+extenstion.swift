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

//MARK: - With the help of this class I indent the label

class WarningLabel: UILabel {
    
    var sidePadding = CGFloat(10) // Needed padding, add property observers

    override func sizeToFit() {
        super.sizeToFit()
        bounds.size.width += 2 * sidePadding
    }

    override func drawText(in rect: CGRect) {
        print(rect)
        super.drawText(in: rect.insetBy(dx: sidePadding, dy: 0))
        invalidateIntrinsicContentSize()
    }
}
