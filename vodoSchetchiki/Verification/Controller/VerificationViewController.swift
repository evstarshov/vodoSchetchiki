//
//  VerificationController.swift
//  vodoSchetchiki
//
//  Created by Mac on 11.12.2022.
//

import UIKit

class VerificationViewController: UIViewController {

    //MARK: - Properties
    
    var verificationView: VerificationView?
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = verificationView
    }
}
