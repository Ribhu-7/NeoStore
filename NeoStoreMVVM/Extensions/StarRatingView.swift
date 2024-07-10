//
//  StarRatingView.swift
//  NeoStoreMVVM
//
//  Created by Apple on 09/07/24.
//

import UIKit

extension UIView {

    func setStarRating(rating: Int){
        let starStackView = UIStackView()
        starStackView.alignment = .fill
        starStackView.distribution = .fillEqually
        starStackView.spacing = 10
       // var arrImageViews = [UIImageView]()
        for i in 1...5 {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            if i <= rating {
                imageView.image = UIImage(named: "star_check")
            } else {
                imageView.image = UIImage(named: "star_unchek")
            }
            starStackView.addArrangedSubview(imageView)
        }
        starStackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(starStackView)
        starStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        starStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor , constant: 5.0).isActive = true
        starStackView.leftAnchor.constraint(equalTo: self.leftAnchor , constant: 1.0).isActive = true
        starStackView.widthAnchor.constraint(equalTo: self.widthAnchor , constant: 0.2).isActive = true
        //starStackView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 0.2).isActive = true
        
    }

}
