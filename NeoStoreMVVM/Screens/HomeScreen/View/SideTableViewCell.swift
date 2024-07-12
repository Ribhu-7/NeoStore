//
//  SideTableViewCell.swift
//  NeoStoreMVVM
//
//  Created by Apple on 05/07/24.
//

import UIKit

class SideTableViewCell: UITableViewCell {

    @IBOutlet weak var sideLbl: UILabel!
    @IBOutlet weak var sideImg: UIImageView!
    
    @IBOutlet weak var sideCartBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
