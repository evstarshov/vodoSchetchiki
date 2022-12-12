//
//  ViewController.swift
//  vodoSchetchiki
//
//  Created by Евгений Старшов on 13.11.2022.
//

import UIKit
import MessageUI
import Foundation
import FirebaseFirestore

class MainViewController: UIViewController {
    
    //MARK: - private properties
    
    private var mainView = MainView()
    
    //MARK: - Constraction
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeDown()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(sendMail),
                                               name: .notificationFromTButton,
                                               object: nil)
        delegateTextField()

    }
    
    override func loadView() {
        self.view = mainView
    }
    //MARK: - private functions

    private func delegateTextField() {
        mainView.coldWaterTextField.delegate = self
        mainView.hotWaterTextField.delegate = self
    }
    
    @objc private func sendMail(notification: Notification) {
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["email@mail.com"])
            mail.setSubject("Показания счетчиков")
            mail.setMessageBody("Холодная вода: \(mainView.coldWaterTextField.text ?? ""), Горячая вода: \(mainView.coldWaterTextField.text ?? "").", isHTML: true)
            present(mail, animated: true)
        } else {
            errorAlert(title: "Ошибка", message: "Нет доступа к почте")
        }
    }
    
    private func swipeDown() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
        swipeDown.delegate = self
        swipeDown.direction =  UISwipeGestureRecognizer.Direction.down
        self.mainView.addGestureRecognizer(swipeDown)
    }
    
    @objc private func hideKeyboardOnSwipeDown() {
        view.endEditing(true)
    }
}

//MARK: - Extension

extension MainViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
}

extension MainViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

extension MainViewController: UITextViewDelegate {
    
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            let currentCharacterCoun = textView.text?.count ?? 0
            if range.length + range.location > currentCharacterCoun {
                return false
            }
            let newLenght = currentCharacterCoun + text.count - range.length
            return newLenght <= 2
        }

        func textViewDidChange(_ textView: UITextView) {
            if mainView.hotWaterTextField.hasText && mainView.coldWaterTextField.hasText {
                mainView.sentIndicationsButton.isEnabled = true
                mainView.sentIndicationsButton.alpha = 1
            } else {
                mainView.sentIndicationsButton.isEnabled = false
                mainView.sentIndicationsButton.alpha = 0.5
            }
        }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if mainView.hotWaterTextField.textColor == .white && mainView.coldWaterTextField.textColor == .white {
            mainView.hotWaterTextField.text = ""
            mainView.coldWaterTextField.text = ""
            mainView.coldWaterTextField.textColor = .systemGray
            mainView.hotWaterTextField.textColor = .systemGray
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if mainView.hotWaterTextField.text == "" && mainView.coldWaterTextField.text == "" {
            mainView.hotWaterTextField.text = "Горячая вода"
            mainView.coldWaterTextField.text = "Холодная вода"
            mainView.coldWaterTextField.textColor = .white
            mainView.hotWaterTextField.textColor = .white
        }
        
    }
    
    
    
}
