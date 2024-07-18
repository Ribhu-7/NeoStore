//
//  OrderDetailsViewCell.swift
//  NeoStoreMVVM
//
//  Created by Apple on 18/07/24.
//

import UIKit

class OrderDetailsViewCell: UITableViewCell {

    @IBOutlet weak var prodName: UILabel!
    
    @IBOutlet weak var prodQty: UILabel!
    
    @IBOutlet weak var prodCategory: UILabel!
    
    @IBOutlet weak var prodAmt: UILabel!
    
    @IBOutlet weak var prodImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
