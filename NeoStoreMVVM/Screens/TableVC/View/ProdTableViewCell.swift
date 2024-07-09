//
//  ProdTableViewCell.swift
//  NeoStoreMVVM
//
//  Created by Apple on 09/07/24.
//

import UIKit

class ProdTableViewCell: UITableViewCell {

    var tabPproduct: TableData? {
        didSet {
            tabConfiguration()
        }
    }
    @IBOutlet weak var prodTablelbl: UILabel!
    
    @IBOutlet weak var prodTblImg: UIImageView!
    
    @IBOutlet weak var prodTbldec: UILabel!
    
    
    @IBOutlet weak var prodTblprc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func tabConfiguration(){
        guard let tabPproduct else {return}
        
        prodTablelbl.text = tabPproduct.name
        prodTbldec.text = tabPproduct.producer
        prodTblprc.text = "Rs. \(tabPproduct.cost)"
        prodTblImg.setImage(with: tabPproduct.product_images)
    }
    
}
