//
//  HomeViewExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 08/07/24.
//

import Foundation
import UIKit

extension HomeViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let productVC = UIStoryboard().getStoryBoard().instantiateViewController(withIdentifier: "productVC") as! ProductViewController
        
        if let touch = touches.first {
            if tableProdView == touch.view {
                
                productVC.prodCatId = 1
                self.navigationController?.pushViewController(productVC, animated: true)
                
            } else if chairProdView == touch.view {
                
                productVC.prodCatId = 2
                self.navigationController?.pushViewController(productVC, animated: true)
                
            } else if sofaProdView == touch.view {
                
                productVC.prodCatId = 3
                self.navigationController?.pushViewController(productVC, animated: true)
                
            } else if cupboardView == touch.view {
                
                productVC.prodCatId = 4
                self.navigationController?.pushViewController(productVC, animated: true)
                
            } else if parentView == touch.view {
                self.hideSideMenu()
            } else if rightsideView == touch.view {
                self.hideSideMenu()
            }
            
        }
    }
    
}
