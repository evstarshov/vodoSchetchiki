//
//  VerificationController.swift
//  vodoSchetchiki
//
//  Created by Mac on 11.12.2022.
//

import UIKit
import FirebaseAuth

protocol VerificationViewDelegate: AnyObject {
    func goToMain(from: VerificationViewController)
}

class VerificationViewController: UIViewController {

    //MARK: - Properties
    
    var verificationView: VerificationView?
    var verificationID: String?
    
    weak var coordinatorDelegate: VerificationViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateTextView()
        NotificationCenter.default.addObserver(self, selector: #selector(gotoNext), name: .notificationTabBar, object: nil)
    }
    
    override func loadView() {
        view = verificationView
    }
    
    @objc func gotoNext() {
        print("Next button tapped")
        coordinatorDelegate?.goToMain(from: self)
    }
    
    //MARK: - Private function
    
    private func delegateTextView() {
        verificationView?.verificationTextView.delegate = self
    }
    
}

//MARK: - Extention


extension VerificationViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentCharacterCoun = textView.text?.count ?? 0
        if range.length + range.location > currentCharacterCoun {
            return false
        }
        let newLenght = currentCharacterCoun + text.count - range.length
        return newLenght <= 6
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count == 6 {
            verificationView?.sentVerificationCodeButton.isEnabled = true
            verificationView?.sentVerificationCodeButton.alpha = 1
            verificationView?.sentVerificationCodeButton.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
            verificationView?.sentVerificationCodeButton.layer.shadowRadius = 3
            verificationView?.sentVerificationCodeButton.layer.shadowOpacity = 0.2
            verificationView?.sentVerificationCodeButton.layer.shadowColor = UIColor.black.cgColor

        } else {
            verificationView?.sentVerificationCodeButton.isEnabled = false
            verificationView?.sentVerificationCodeButton.alpha = 0.5
        }
    }
}
