//
//  MainPresenter.swift
//  vodoSchetchiki
//
//  Created by Mac on 17.12.2022.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseFirestore


protocol Presentor {

    func saveMeter(coldMeter: String, hotMeter: String)
}

class MainPresenter {
    
    private var ref: DocumentReference? = nil
    private var db: Firestore!
    
}

extension MainPresenter: Presentor {
    
    public func saveMeter(coldMeter: String, hotMeter: String) {
        
        let setting = FirestoreSettings()
        Firestore.firestore().settings = setting
        db = Firestore.firestore()
        
        ref = db.collection("meters").addDocument(data: [
            "Cold meter" : coldMeter,
            "Hot meter" : hotMeter
        ]) { err in
            if let _ = err {
                print("Ошибка базы данных")
            } else {
                print("Данные сохранены")
            }
        }
    }
}
