//
//  DataModel.swift
//  TestApp
//
//  Created by bharats802 on 30/03/21.
//

import UIKit

protocol DetailsDataModelDelegate {
    func didGetDetails(person: AnyObject?)
}
    
class DetailsDataModel: NSObject {
    
    var persons: [AnyObject]?
    var didGetDetails: (() -> Void)?
    let json = MockDatabase()
    var delegate: DetailsDataModelDelegate?
    
    func getDetailsForPerson(name: String) {
        json.getPersonDetails(name: name)
        json.didCompletePersonnDetails = { [weak self, weak json] in
            DispatchQueue.main.async {
                let person = json?.selectedPerson
                self?.delegate?.didGetDetails(person: person)
            }
        }
    }
}
