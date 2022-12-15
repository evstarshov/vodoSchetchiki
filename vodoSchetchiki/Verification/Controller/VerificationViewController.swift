//
//  VerificationController.swift
//  vodoSchetchiki
//
//  Created by Mac on 11.12.2022.
//

import UIKit
import FirebaseAuth

class VerificationViewController: UIViewController {

    //MARK: - Properties
    
    var verificationView: VerificationView?
    var verificationID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = verificationView
    }
    
}

//MARK: - Extention


extension VerificationViewController: UITextViewDelegate {
    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        let currentCharacterCoun = textView.text?.count ?? 0
//        if range.length + range.location > currentCharacterCoun {
//            return false
//        }
//        let newLenght = currentCharacterCoun + text.count - range.length
//        return newLenght <= 6
//    }
//    
//    func textViewDidChange(_ textView: UITextView) {
//        if verificationView?.verificationTextView.text.count == 6 {
//            verificationView?.sentVerificationCodeButton.isEnabled = true
//            verificationView?.sentVerificationCodeButton.alpha = 1
//        } else {
//            verificationView?.sentVerificationCodeButton.isEnabled = false
//            verificationView?.sentVerificationCodeButton.alpha = 0.5
//        }
//    }
}
