//
//  ViewController.swift
//  TestApp
//
//  Created by bharats802 on 30/03/21.
//

import UIKit

class ViewController: UIViewController {

    let dataModel = DataModel()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataModel.loadData()
        addHandler()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func addHandler() {
        dataModel.didGetData = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.persons?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        if let person = dataModel.persons?[indexPath.row] {
            let kempty = "-"
            cell.labelFirstName.text = person["FirstName"] as? String ?? kempty
            cell.labelLastName.text = person["LastName"] as? String ?? kempty
            let personType = person["Type"] as? String ?? kempty
            cell.labelType.text = personType
            if personType == "Crew" {
                cell.labelTitle.text = person["Title"] as? String ?? kempty
                cell.stackViewTitles.addArrangedSubview(cell.labelTitle)
            } else {
                cell.stackViewTitles.removeAllSubview()
            }
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let person = dataModel.persons?[indexPath.row] {
            let kempty = "-"
            let name = person["FirstName"] as? String ?? kempty
            let sb = UIStoryboard(name: "Main", bundle: nil)
            if let vc = sb.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController {
                vc.name = name
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
