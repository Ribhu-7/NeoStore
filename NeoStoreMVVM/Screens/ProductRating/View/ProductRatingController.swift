//
//  ProductRatingController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 15/07/24.
//

import UIKit

class ProductRatingController: UIViewController {

    @IBOutlet weak var prodratingLbl: UILabel!
    @IBOutlet var outerView: UIView!
    
    @IBOutlet weak var prodRatingImg: UIImageView!
    
    @IBOutlet weak var rateNow: UIButton!
    @IBOutlet weak var prodRating: UIView!
    
    @IBOutlet weak var innerView: UIView!
    var prodImg: String!
    var prodRate: Int!
    var prodLbl: String!
    var prodID: Int!
    
    let sb = UIStoryboard(name: "Main", bundle: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prodRating.setStarRating(rating: prodRate)
        prodRatingImg.setImage(with: prodImg)
        prodratingLbl.text = prodLbl
        print(prodID!)
        //print(prodLbl ?? "nil")
    }
    

    @IBAction func rateNowClick(_ sender: Any) {
        
        let tapGesture = UITapGestureRecognizer(target: self.prodRating, action: #selector(starClicked))
        
        let req = RatingRequest(product_id: String(prodID), rating: 4)
        self.rateRequest(logs: req)
        
        dismiss(animated: true)
    }
  
    @objc func starClicked(){
        
    }

}
