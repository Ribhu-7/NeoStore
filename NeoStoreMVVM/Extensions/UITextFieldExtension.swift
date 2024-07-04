//
//  UITextFieldExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 01/07/24.
//

import Foundation
import UIKit

extension UITextField {
    
    func setContent(_ placeName: String , _ imageName: String){
        self.layer.borderWidth = 1.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderColor = UIColor.white.cgColor
        let placeHolder = NSAttributedString(string: placeName, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        self.attributedPlaceholder = placeHolder
        
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20 , height: 20))
                imageView.image = UIImage(named: imageName)
                let imageViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 55 , height: 40))
                imageViewContainer.addSubview(imageView)
                leftView = imageViewContainer
                leftViewMode = .always
        self.autocorrectionType = .no
        self.spellCheckingType = .no
    }
    
}
