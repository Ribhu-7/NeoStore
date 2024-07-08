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
        if let touch = touches.first {
            if tableProdView == touch.view {
                let tableVC = sb.instantiateViewController(withIdentifier: "tableVC")
                self.navigationController?.pushViewController(tableVC, animated: true)
            } else if chairProdView == touch.view {
                let chairVC = sb.instantiateViewController(withIdentifier: "chairVC")
                self.navigationController?.pushViewController(chairVC, animated: true)
            } else if sofaProdView == touch.view {
                let sofaVC = sb.instantiateViewController(withIdentifier: "sofaVC")
                self.navigationController?.pushViewController(sofaVC, animated: true)
            } else if cupboardView == touch.view {
                let cupboardVC = sb.instantiateViewController(withIdentifier: "cupboardVC")
                self.navigationController?.pushViewController(cupboardVC, animated: true)
            }
            
        }
    }
    
}