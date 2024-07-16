//
//  AddressListCell.swift
//  NeoStoreMVVM
//
//  Created by Apple on 16/07/24.
//

import UIKit

class AddressListCell: UITableViewCell {

    @IBOutlet weak var addressHead: UILabel!
    
    @IBOutlet weak var addressDesc: UILabel!
    
    @IBOutlet weak var addressBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
