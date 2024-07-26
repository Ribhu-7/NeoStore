//
//  ImageExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 05/07/24.
//

import Foundation
import UIKit

extension UIImageView {
  public func maskCircle(anyImage: UIImage) {
    self.contentMode = UIView.ContentMode.scaleAspectFill
    self.layer.cornerRadius = self.frame.height / 2
    self.layer.masksToBounds = false
    self.clipsToBounds = true
    self.image = anyImage
  }
    func addButton(){
       
        
    }
}
