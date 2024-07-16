//
//  StarRatingView.swift
//  NeoStoreMVVM
//
//  Created by Apple on 09/07/24.
//

import UIKit

extension UIView {

    //private lazy var starStackView = UIStackView()
    func setStarRating(rating: Int){
        let starStackView = UIStackView()
        starStackView.alignment = .fill
        starStackView.distribution = .fillEqually
        starStackView.spacing = 10
        var arrImageViews = [UIImageView]()
        for i in 1...5 {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            if i <= rating {
                imageView.image = UIImage(named: "star_check")
            } else {
                imageView.image = UIImage(named: "star_unchek")
            }
            imageView.tag = i
            starStackView.addArrangedSubview(imageView)
            arrImageViews.append(imageView)
        }
        starStackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(starStackView)
        starStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        starStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor , constant: 5.0).isActive = true
        starStackView.leftAnchor.constraint(equalTo: self.leftAnchor , constant: 1.0).isActive = true
        starStackView.widthAnchor.constraint(equalTo: self.widthAnchor , constant: 0.2).isActive = true
        starStackView.arrangedSubviews.forEach { subview in
                    guard let starImageView = subview as? UIImageView else {
                        return
                    }
                    starImageView.isHighlighted = starImageView.tag <= rating
                }
        //starStackView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 0.2).isActive = true
       
//        let tapGesture = UITapGestureRecognizer()
//        starStackView.addGestureRecognizer(tapGesture)
//        let location = tapGesture.location(in: starStackView)
//        let starWidth = starStackView.bounds.width / 5
//        let rate = Int(location.x/starWidth) + 1
//        if rate != rating {
//            setStarRating(rating: rate)
//            //RatingRequest(product_id: <#T##String#>, rating: rate)
//        }
    }
    
    func handleTouch(withTouches touches: Set<UITouch>){
        
    }
    
//    @objc func starClicked(gesture: UITapGestureRecognizer){
//        let location = gesture.location(in: starSta)
//    }
}
