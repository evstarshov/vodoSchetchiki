//
//  UIButton.swift
//  vodoSchetchiki
//
//  Created by Mac on 17.12.2022.
//

import UIKit

extension UIButton {
    
    func startAnimatingPressActions() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }
    
    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.97, y: 0.97))
        sender.layer.shadowOffset = CGSize(width: 0, height: 0)
        sender.layer.shadowRadius = 0
        sender.layer.shadowOpacity = 0
        sender.layer.shadowColor = UIColor.black.cgColor
    }
    
    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
        sender.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        sender.layer.shadowRadius = 5
        sender.layer.shadowOpacity = 0.3
        sender.layer.shadowColor = UIColor.black.cgColor

    }
    
    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut],
                       animations: {
                        button.transform = transform
            }, completion: nil)

    }
    
}
