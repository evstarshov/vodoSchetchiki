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
    
    func getData(success: @escaping ([MetersModel]) -> Void, failture: @escaping (NSError) -> Void) {
        servise.getDataMeters() { [weak self] data in
            guard let self else { return }
            self.meters = data ?? []
            success(data ?? [])
        }
    }

}

