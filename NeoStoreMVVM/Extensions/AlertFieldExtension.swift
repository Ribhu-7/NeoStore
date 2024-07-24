//
//  AlertFieldExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 04/07/24.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(message: String){
        let alert = UIAlertController(title: nil,message: message,preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        {
            (action) in (self.dismiss(animated: true,completion: nil))
        }
        alert.addAction(action)
        self.present(alert,animated: true,completion: nil)
        
    }

    func showVC(name: String){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let VC = sb.instantiateViewController(withIdentifier: "name")
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
