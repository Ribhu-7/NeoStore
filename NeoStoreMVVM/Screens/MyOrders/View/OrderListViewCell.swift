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
    
    var order: OrderData? {
        didSet {
            configuration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configuration(){
        guard let order else {return}
        
        orderId.text = String(order.id)
        orderDate.text = order.created
        orderAmt.text = String(order.cost)
    }
    
}
