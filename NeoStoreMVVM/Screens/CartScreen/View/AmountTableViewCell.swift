//
//  AmountTableViewCell.swift
//  NeoStoreMVVM
//
//  Created by Apple on 11/07/24.
//

import UIKit

class AmountTableViewCell: UITableViewCell {

    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var totalPrc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
