//
//  CartExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 10/07/24.
//

import Foundation
import UIKit

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.cartViewModel.products.count + 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < self.cartViewModel.products.count {
            let tb = self.cartViewModel.products[indexPath.row]
            let itemPrice = Int(tb.product.cost) * tb.quantity
            self.totalCartAmt = self.totalCartAmt + itemPrice
            let cell = cartTableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
            
            cell.cartHead.text = tb.product.name
            cell.cartDesc.text = tb.product.product_category
            cell.cartItem.titleLabel?.text = String(tb.quantity)
            cell.cartPrice.text = "Rs. \(itemPrice)"
            cell.cartImageView.setImage(with: tb.product.product_images)
            
            return cell
        }
        else {
            let cell = cartTableView.dequeueReusableCell(withIdentifier: "AmountTableViewCell", for: indexPath) as! AmountTableViewCell
            cell.totalPrc.text = "Rs.\(self.totalCartAmt)"
            self.totalCartAmt = 0
            return cell
        }
        
        //        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        //        return 200
    }
}
