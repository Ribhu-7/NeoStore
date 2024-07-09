//
//  SofaTableViewCell.swift
//  NeoStoreMVVM
//
//  Created by Apple on 09/07/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    var sofaPproduct: ProdData? {
        didSet {
            sofaConfiguration()
        }
    }
    
    @IBOutlet weak var prodTblImg: UIImageView!
    @IBOutlet weak var prodHeading: UILabel!
    @IBOutlet weak var prodDesc: UILabel!
    @IBOutlet weak var prodPrice: UILabel!
    @IBOutlet weak var prodRating: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func sofaConfiguration(){
        
    }
}
