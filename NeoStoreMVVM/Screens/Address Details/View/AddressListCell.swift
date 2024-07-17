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
        addressBtn.setImage(UIImage.init(systemName: "circle.inset.filled"), for: .selected)
        addressBtn.setImage(UIImage.init(systemName: "circle"), for: .normal)
//        addressBtn.setImage(UIImage.init(named: "chkn"), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
//        addressBtn.setImage(UIImage.init(named: "chky"), for: .selected)
    }
    
    @IBAction func btnClick(_ sender: Any) {
        //addressBtn.setImage(UIImage(named: "chky"), for: .selected)
        if addressBtn.isSelected == true {
            addressBtn.isSelected = false
        } else {
            addressBtn.isSelected = true
        }
    }
}
