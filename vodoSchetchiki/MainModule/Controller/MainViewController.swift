//
//  ViewController.swift
//  vodoSchetchiki
//
//  Created by Евгений Старшов on 13.11.2022.
//

import UIKit
import MessageUI
import Foundation

 class MainViewController: UIViewController {
    
    //MARK: - private properties
         
     private var mainView = MainView()
    
     //MARK: - Constraction
     
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeDown()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(sendMail),
                                               name: Notification.Name(rawValue: "Send"),
                                                object: nil)
    }
    
    override func loadView() {
        self.view = mainView
    }
     //MARK: - private functions
     
      @objc private func sendMail(notification: Notification) {
          if MFMailComposeViewController.canSendMail() {
              let mail = MFMailComposeViewController()
              mail.mailComposeDelegate = self

              //TODO: - Нужно узнать почту на которую будет отправляться письма
              mail.setToRecipients(["email@mail.com"])
              //TODO: - Нужно реализовать передачу данных (Имя, номер квартиры), что б добавить их в заголовок письма
              mail.setSubject("Показания счетчиков")
              //TODO: - Нужно реализовать передачу данных с textField
              mail.setMessageBody("Холодная вода: , Горячая вода:.", isHTML: true)
          } else {
              //TODO: - Нужно создать алерт
              print("Error")
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
