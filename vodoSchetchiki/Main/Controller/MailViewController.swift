//
//  MailViewController.swift
//  vodoSchetchiki
//
//  Created by Mac on 18.12.2022.
//

import Foundation
import UIKit
import MessageUI

protocol MainViewControllerDelegate: AnyObject {
    func saveData()
}

class MailViewController: MFMailComposeViewController {
        
    weak var mainViewControllerDelegate: MainViewControllerDelegate?
    
    init(coldWater: String, hotWater: String) {
        super.init(nibName: nil, bundle: nil)
        mailComposeDelegate = self
        setToRecipients(["email@mail.com"])
        setSubject("Показания счетчиков")
        setMessageBody("Холодная вода: \(coldWater), Горячая вода: \(hotWater).", isHTML: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MailViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result {
        case .sent:
            dismiss(animated: true)
            mainViewControllerDelegate?.saveData()
            print("Mail send")
        case .cancelled:
            dismiss(animated: true)
            mainViewControllerDelegate?.saveData()
            print("Cancelled")
        case .failed:
            errorAlert(title: "Ошибка", message: "Произошел какой то сбой")
        case .saved:
            errorAlert(title: "", message: "Письмо сохранено в черновиках")
        @unknown default:
            print("Fatal error")
        }
    }
}
