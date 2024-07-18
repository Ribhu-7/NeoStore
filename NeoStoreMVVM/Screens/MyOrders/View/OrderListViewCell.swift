//
//  OrderListViewCell.swift
//  NeoStoreMVVM
//
//  Created by Apple on 17/07/24.
//

import UIKit

class OrderListViewCell: UITableViewCell {

    @IBOutlet weak var orderId: UILabel!
    
    @IBOutlet weak var orderDate: UILabel!
    
    @IBOutlet weak var orderAmt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
