//
//  ProductListViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 09/07/24.
//

import UIKit

class ProductListViewController: UIViewController , UIPopoverControllerDelegate, UIPopoverPresentationControllerDelegate {

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
        self.view.alpha = 1
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
    
    override func prepare(for segue: UIStoryboardSegue , sender: Any?){
        if segue.identifier == "ratingSegue" {
            let popup = segue.destination as! ProductRatingController
            popup.prodLbl = prodHead
            popup.prodImg = prodImg
            popup.prodRate = prodRate
            popup.prodID = prodID
            
        }
        else if segue.identifier == "quantitySegue" {
            let popup = segue.destination as! ProductQuantityController
            popup.prodLbl = prodHead
            popup.prodImg = prodImg
            popup.prodId = prodID
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationItem.backButtonTitle = ""
    }
    
    @IBAction func buyNow(_ sender: Any) {
//        let req = CartRequest(product_id: prodID, quantity: 1)
//        cartViewModel.addtoCart(cartreq: req)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
//           self.showCart()
//        }
    }
    
    @objc func searchClicked(){
        
    }


    @IBAction func rateUs(_ sender: Any) {
      
    
//        ratingVC.modalPresentationStyle = .overCurrentContext
//        ratingVC.modalTransitionStyle = .crossDissolve
//        ratingVC.view.backgroundColor = UIColor.white.withAlphaComponent(0.9)
//        self.view.alpha = 0.4
//
//        ratingVC.preferredContentSize = CGSizeMake(300, 300)
//        self.navigationController?.present(ratingVC, animated: true)
    }
    
}
