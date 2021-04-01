//
//  CustomCell.swift
//  TestApp
//
//  Created by bharats802 on 30/03/21.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var labelFirstName: UILabel!
    @IBOutlet weak var labelLastName: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var stackViewTitles: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
