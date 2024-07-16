//
//  LoginViewModel.swift
//  NeoStoreMVVM
//
//  Created by Apple on 03/07/24.
//

import Foundation
import UIKit


extension ProductListViewController {

    func showCart(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let cartVC = sb.instantiateViewController(withIdentifier: "cartVC") as! CartViewController
        self.navigationController?.pushViewController(cartVC, animated: true)
    }
}
