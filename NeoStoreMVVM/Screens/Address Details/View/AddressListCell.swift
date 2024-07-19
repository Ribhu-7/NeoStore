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
    
    @IBOutlet weak var btnImage: UIImageView!
    
    var isCheck = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //        addressBtn.setImage(UIImage.init(systemName: "circle.inset.filled"), for: .selected)
        //        addressBtn.setImage(UIImage.init(systemName: "circle"), for: .normal)
        //        addressBtn.setImage(UIImage.init(named: "chkn"), for: .normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
}
