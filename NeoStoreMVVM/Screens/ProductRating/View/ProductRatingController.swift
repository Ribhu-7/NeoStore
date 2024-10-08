//
//  ProductRatingController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 15/07/24.
//

import UIKit

protocol ProductRatingDelegate {
    func ratingAdded(req: RatingRequest)
}

class ProductRatingController: UIViewController {

    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var bottomView: UIView!
    
  //  @IBOutlet weak var prodRatings: StarRatingView!
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
    
    var productRatingDelegate: ProductRatingDelegate?
    let sb = UIStoryboard(name: "Main", bundle: nil)
    var prodRatingVM = ProductRatingVM()
    private var selectedRate: Int = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //prodRating.setStarRating(rating: self.selectedRate)
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
        UserDefaults.standard.set(selectedRate, forKey: "ProdRating: \(prodID ?? 0)")
        //self.rateRequest(logs: req)
        prodRatingVM.rateRequest(logs: req)
        print("Rating::",UserDefaults.standard.integer(forKey: "prodRating"))
        self.productRatingDelegate?.ratingAdded(req: req)
        dismiss(animated: true)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if topView == touch.view || bottomView == touch.view {
                dismiss(animated: true)
            }
        }
    }
}
