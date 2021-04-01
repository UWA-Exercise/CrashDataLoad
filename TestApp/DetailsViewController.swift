//
//  DetailsViewController.swift
//  TestApp
//
//  Created by bharats802 on 30/03/21.
//

import UIKit
import MBProgressHUD
class DetailsViewController: UIViewController, DetailsDataModelDelegate {

    @IBOutlet weak var labelName: UILabel!
    
    var dataModel = DetailsDataModel()
    var name: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        dataModel.getDetailsForPerson(name: name ?? "")
        dataModel.delegate = self
        // Do any additional setup after loading the view.
        let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.label.text = "Loading"
        labelName.text = nil
    }

    func didGetDetails(person: AnyObject?) {
        guard let person = person else {
            return
        }
        DispatchQueue.main.async {
            self.loadData(person: person)
        }
    }
    
    func loadData(person: AnyObject) {
        labelName.text = person["FirstName"] as? String ?? "-"
        navigationController!.navigationItem.title = person["Type"] as? String
        MBProgressHUD.hide(for: view, animated: true)
    }
}
