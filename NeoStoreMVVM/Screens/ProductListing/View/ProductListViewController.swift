//
//  ProductListViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 09/07/24.
//

import UIKit


class ProductListViewController: UIViewController , UIPopoverControllerDelegate, UIPopoverPresentationControllerDelegate, CartViewControllerDelegate {
    func showCartMenu() {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let cartVC = sb.instantiateViewController(withIdentifier: "cartVC") as! CartViewController
            self.navigationController?.pushViewController(cartVC, animated: true)
            
        }
        
    }
    
    @IBOutlet weak var prodHeading: UILabel!
    
    @IBOutlet weak var hideImage: UIView!
    @IBOutlet weak var prodStock: UILabel!
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
    var prodQuantity: Int!
    var prodViewCount: Int!
    
    var cartViewModel = CartViewModel()
    var cartViewController : CartViewController?
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
        
        
        if prodViewCount == 0 {
            prodStock.isHidden = false
            hideImage.isHidden = false
        } else {
            prodStock.isHidden = true
            hideImage.isHidden = true
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue , sender: Any?){
//        if segue.identifier == "ratingSegue" {
//            let popup = segue.destination as! ProductRatingController
//            popup.prodLbl = prodHead
//            popup.prodImg = prodImg
//            popup.prodRate = prodRate
//            popup.prodID = prodID
//            //cartViewController?.delegate
//
//        }
        //        else if segue.identifier == "quantitySegue" {
        //            let popup = segue.destination as! ProductQuantityController
        //            popup.prodLbl = prodHead
        //            popup.prodImg = prodImg
        //            popup.prodId = prodID
        //        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationItem.backButtonTitle = ""
    }
    
    @IBAction func buyNow(_ sender: Any) {

        let sb = UIStoryboard(name: "Main", bundle: nil)
        let prodQuantity = sb.instantiateViewController(withIdentifier: "prodQuantity") as! ProductQuantityController
        prodQuantity.prodImg = prodImg
        prodQuantity.prodLbl = prodHead
        prodQuantity.prodId = prodID
        prodQuantity.productQuantityDelegate = self
        prodQuantity.modalPresentationStyle = .overFullScreen
        prodQuantity.modalTransitionStyle = .crossDissolve
        self.present(prodQuantity, animated: true)
        
        
        //print(prodQuantity)
        //print("Prod Quantity::::",prodQuantity)
//        var quant = 0
//        if prodQuantity != nil {
//            quant = prodQuantity
//        } else {
//            quant = 1
//        }
//        let req = CartRequest(product_id: prodID, quantity: 1)
//        cartViewModel.addtoCart(cartreq: req)
//
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
//            self.showCart()
//        }
        //        let sb = UIStoryboard(name: "Main", bundle: nil)
        //        let prodQuantity = sb.instantiateViewController(withIdentifier: "prodQuantity") as! ProductQuantityController
        //        prodQuantity.prodImg = prodImg
        //        prodQuantity.prodLbl = prodHead
        //        prodQuantity.prodId = prodID
        //        self.present(prodQuantity, animated: true)
    }
    
    @IBAction func rateNow(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let prodRating = sb.instantiateViewController(withIdentifier: "productRating") as! ProductRatingController
        prodRating.prodImg = prodImg
        prodRating.prodLbl = prodHead
        prodRating.prodRate = prodRate
        prodRating.prodID = prodID
        prodRating.modalPresentationStyle = .overFullScreen
        prodRating.modalTransitionStyle = .crossDissolve
        self.present(prodRating, animated: true)
    }
    
    @objc func searchClicked(){
        
    }
    
    @IBAction func shareBtn(_ sender: Any) {
        print("Share Item")
        
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

extension ProductListViewController : ProductQuantityDelegate {
    func quantityAdded() {
        self.showCart()
    }
}
