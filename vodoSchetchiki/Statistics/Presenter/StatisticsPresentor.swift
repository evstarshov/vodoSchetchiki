//
//  StatisticsPresentor.swift
//  vodoSchetchiki
//
//  Created by Mac on 19.12.2022.
//

import Foundation
import FirebaseFirestore
import FirebaseCore

protocol StatisticsPresenterInput: AnyObject {
    func succes()
}

protocol StatisticsPresenterOutput: AnyObject {
    init(view: StatisticsPresenterInput, firebaseServise: FirebaseServiceProtocol)
    func getData()
    var meters: [MetersModel]? { get set }
}

class StatisticsPresenter: StatisticsPresenterOutput {
    
    weak var view: StatisticsPresenterInput?
    var meters: [MetersModel]?
    var firebaseService: FirebaseServiceProtocol!
    
    required init(view: StatisticsPresenterInput, firebaseServise: FirebaseServiceProtocol) {
        self.view = view
        self.firebaseService = firebaseServise
        getData()
    }
    
    func getData() {
        firebaseService.getData(collection: "Meters") { [weak self] doc in
            guard doc != nil else { print("error"); return }
            guard let self else { return }
            self.meters = doc
            print("\(doc)")
            self.view?.succes()
        }
        
    }
    
}
