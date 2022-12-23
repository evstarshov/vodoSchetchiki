//
//  StatisticsViewModel.swift
//  vodoSchetchiki
//
//  Created by Mac on 21.12.2022.
//

import Foundation
import UIKit

protocol StatisticsViewModelDelegate: AnyObject {
    func changeMetersData(coldMeter: String)
}

class StatisticsViewModel {
    
    var servise = FirebaseService()
    var meters: [MetersModel] = []
    
    var coldMeter: String {
        didSet {
            viewModelDelegate?.changeMetersData(coldMeter: meters.first?.coldMeter ?? "Data error")
        }
    }

    
    weak var viewModelDelegate: StatisticsViewModelDelegate? {
        didSet {
            viewModelDelegate?.changeMetersData(coldMeter: coldMeter )
        }
    }
    
    func getData(success: @escaping ([MetersModel]) -> Void, failture: @escaping (NSError) -> Void) {
        servise.getData(collection: "Meters") { [weak self] data in
            guard let self else { return }
            self.meters = data ?? []
            success(data ?? [])
        }
    }
    
    init() {
        coldMeter = "Error"
    }
}

