//
//  CartTableViewCell.swift
//  NeoStoreMVVM
//
//  Created by Apple on 11/07/24.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var cartImageView: UIImageView!
    
    @IBOutlet weak var cartHead: UILabel!
    
    @IBOutlet weak var cartDesc: UILabel!
    
    
    @IBOutlet weak var cartPrice: UILabel!
    
    @IBOutlet weak var cartItem: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
