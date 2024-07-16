//
//  StarRating.swift
//  NeoStoreMVVM
//
//  Created by Apple on 16/07/24.
//

import UIKit

extension UIView {
    func setStarRate(rating: Int) -> Int{
        let starStackView = UIStackView()
        starStackView.alignment = .fill
        starStackView.distribution = .fillEqually
        starStackView.spacing = 10
        var arrImageViews = [UIImageView]()
        
        for i in 1...5 {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "star_unchek")
            imageView.tag = i
            starStackView.addArrangedSubview(imageView)
            arrImageViews.append(imageView)
        }
        for i in 0...rating {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "star_check")
            imageView.tag = i
            starStackView.addArrangedSubview(imageView)
        }
        starStackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(starStackView)
        starStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        starStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor , constant: 5.0).isActive = true
        starStackView.leftAnchor.constraint(equalTo: self.leftAnchor , constant: 1.0).isActive = true
        starStackView.widthAnchor.constraint(equalTo: self.widthAnchor , constant: 0.2).isActive = true
        //starStackView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 0.2).isActive = true
        let tapGesture = UITapGestureRecognizer()
        starStackView.addGestureRecognizer(tapGesture)
        let location = tapGesture.location(in: starStackView)
        //let starWidth = starStackView.bounds.width / CGFloat(5)
        //print("Star width: ",starWidth)
        let rate = 1
        
        if rating != rate{
            self.setStarRating(rating: rate)
        }
        return rate
    }
    
    

}
