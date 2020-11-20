//
//  CandyData.swift
//  00857202_hw4
//
//  Created by User16 on 2020/11/18.
//

import Foundation
import Combine

class CandyData: ObservableObject {
    @Published var Candys = [Candy]()
    var cancellable: AnyCancellable?
    
    
    init() {
        
        if let data = UserDefaults.standard.data(forKey: "candys") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Candy].self, from: data) {
                Candys = decodedData
            }
        }
        
        
        cancellable = $Candys
            .sink { (value) in
                let encoder = JSONEncoder()
                do {
                    let data = try encoder.encode(value)
                    UserDefaults.standard.set(data, forKey: "candys")
                } catch {
                    
                }
        }
        
    }
}
