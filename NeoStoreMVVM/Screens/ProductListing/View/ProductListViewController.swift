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
    @IBOutlet weak var prodPrice: UILabel!
    @IBOutlet weak var prodImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var centerImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    var prodHead : String!
    var prodCatg : String!
    var prodDes : String!
    var prodRate : Int!
    var prodPrc: String!
    var prodImg: String!
    var prodID: Int!
    
    var cartViewModel = CartViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
        // Do any additional setup after loading the view.
        prodHeading.text = prodHead
        prodCategory.text = prodCatg
        prodDesc.text = prodDes
        prodRatingView.setStarRating(rating: prodRate)
        prodImageView.setImage(with: prodImg)
        leftImageView.setImage(with: prodImg)
        leftImageView.setBorder(colour: .red)
        centerImageView.setBorder(colour: .lightGray)
        rightImageView.setBorder(colour: .green)
        centerImageView.setImage(with: prodImg)
        rightImageView.setImage(with: prodImg)
        prodPrice.text = prodPrc
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationItem.backButtonTitle = ""
    }
    
    @IBAction func buyNow(_ sender: Any) {
        let req = CartRequest(product_id: prodID, quantity: 1)
        cartViewModel.addtoCart(cartreq: req)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.showCart()
        }
    }
    
    @objc func searchClicked(){
        
    }


}
