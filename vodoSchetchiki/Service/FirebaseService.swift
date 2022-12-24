//
//  FirebaseService.swift
//  vodoSchetchiki
//
//  Created by Mac on 19.12.2022.
//

import Foundation
import FirebaseCore
import FirebaseDatabase
import FirebaseFirestore

protocol FirebaseServiceProtocol {
    func getData(collection: String, complition: @escaping([MetersModel]?) -> Void)
}

class FirebaseService {
    
    //MARK: - private functions
    
    private func configFirebase() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }
}

extension FirebaseService: FirebaseServiceProtocol {
    
    //MARK: - Public function
    
    public func getData(collection: String, complition: @escaping([MetersModel]?) -> Void) {
        let db = configFirebase()
        db.collection(collection).getDocuments { (document , error)  in
            guard error == nil else { return }
            var meter:[MetersModel]? = []
            let result = document?.documents.map({$0.data()})
            for meters in result! {
                let array = MetersModel(coldMeter: meters["cold_meter"] as? String ?? "nil", hotMeter: meters["hot_meter"] as? String ?? "nil")
                meter?.append(array)
            }
            complition(meter)
        }
    }
    
    public func saveMeter(coldMeter: String, hotMeter: String) {
        
        let db = configFirebase()
        
       
        
        db.collection("Meters").addDocument(data: [
            "cold_meter" : coldMeter,
            "hot_meter" : hotMeter
        ]) { err in
            if let _ = err {
                print("Ошибка базы данных")
            } else {
                print("Данные сохранены")
            }
        }
    }
}

