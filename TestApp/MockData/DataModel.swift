//
//  DataModel.swift
//  TestApp
//
//  Created by bharats802 on 30/03/21.
//

import UIKit

class DataModel: NSObject {
    
    var persons: [AnyObject]?
    var didGetData: (() -> Void)?
    
    func loadData() {
        let fileName = "response"
        let json = MockDatabase()
        json.loadJson(filename: fileName)
        json.didComplete = { [weak self, weak json] in
            DispatchQueue.main.async {
                self?.persons = json?.personList
                self?.didGetData?()
            }
        }
    }
}
