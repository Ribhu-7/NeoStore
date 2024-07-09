//
//  ProductListViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 09/07/24.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var prodHeading: UILabel!
    
    @IBOutlet weak var prodCategory: UILabel!
    
    @IBOutlet weak var prodDesc: UILabel!
    
    @IBOutlet weak var prodRatingView: UIView!
    
    var prodHead : String!
    var prodCatg : String!
    var prodDes : String!
    var prodRate : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prodHeading.text = prodHead
        prodCategory.text = prodCatg
        prodDesc.text = prodDes
        prodRatingView = prodRate ?? UIView()
    }
    



}
