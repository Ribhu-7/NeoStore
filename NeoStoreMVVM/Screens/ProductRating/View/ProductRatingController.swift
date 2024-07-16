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
    
    private var selectedRate: Int = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prodRating.setStarRating(rating: self.selectedRate)
        prodRatingImg.setImage(with: prodImg)
        prodratingLbl.text = prodLbl
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didSelectRate))
        prodRating.addGestureRecognizer(tapGesture)
        print(prodID!)
        //print(prodLbl ?? "nil")
    }
    

    @objc func didSelectRate(gesture: UITapGestureRecognizer){
        let location = gesture.location(in: prodRating)
        let starWidth = prodRating.frame.width / CGFloat(5)
               let rate = Int(location.x / starWidth) + 1
               print(rate)
               if rate != self.selectedRate {
                   prodRating.setStarRating(rating: rate)
                   self.selectedRate = rate
               }
              
    }
    @IBAction func rateNowClick(_ sender: Any) {
        
        let req = RatingRequest(product_id: String(prodID), rating: selectedRate)
        self.rateRequest(logs: req)
        
        dismiss(animated: true)
    }

}
