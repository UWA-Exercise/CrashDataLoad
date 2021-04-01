//
//  MockDatabase.swift
//  TestApp
//
//  Created by bharats802 on 30/03/21.
//

import UIKit

class MockDatabase: NSObject {
    var didComplete: (() -> Void)?
    var didCompletePersonnDetails: (() -> Void)?
    var fileName: String?
    var selectedName: String?
    var personList: [AnyObject]?
    var selectedPerson: AnyObject?

    func loadJson(filename fileName: String) {
        self.fileName = fileName
        getData()
    }

    @objc
    func getData() {
        DispatchQueue.global(qos: .userInitiated).async {
            guard let fileName = self.fileName else {
                return
            }
            if let url = Bundle.main.url(forResource: fileName,
                                         withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    self.personList = object as? [AnyObject]
                } catch {
                    print("Error!! Unable to parse  \(fileName).json")
                }
            }
            self.didComplete?()
        }
    }

    func getPersonDetails(name: String) {
        selectedName = name
        perform(#selector(getPersonDetailsFromFile), with: nil, afterDelay: 8)
    }

    @objc
    func getPersonDetailsFromFile() {
        guard let name = selectedName else {
            return
        }
        if let url = Bundle.main.url(forResource: fileName,
                                     withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [AnyObject]
                selectedPerson = object?.first(where: { item -> Bool in

                    if let fName = item["FirstName"] as? String,
                       fName == name {
                        return true
                    }
                    return false
                })
            } catch {
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
        didCompletePersonnDetails?()
    }
}
