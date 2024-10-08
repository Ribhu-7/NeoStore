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
            let cell = cartTableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
            
            UserDefaults.standard.set(tb.quantity, forKey: "ProdQuant \(String(describing: tb.product_id))" )
            
            UserDefaults.standard.set(tb.product.cost, forKey: "ProdCost \(String(describing: tb.product_id))")
            cell.cartViewDelegate = self
            let cost = UserDefaults.standard.integer( forKey: "ProdCost \(String(describing: tb.product_id))")
            let quant = UserDefaults.standard.integer(forKey: "ProdQuant \(String(describing: tb.product_id))")
            let totalcost = cost*quant
            cell.cartCount.setTitle(String(quant), for: .normal)
            cell.cartPrice.text = "Rs. \(totalcost)"
            cell.cartData = tb
            return cell
        }
        else {
            let cell = cartTableView.dequeueReusableCell(withIdentifier: "AmountTableViewCell", for: indexPath) as! AmountTableViewCell
            let amt = UserDefaults.standard.integer(forKey: "CartAmt")
            if self.cartViewModel.products.count == 0{
                cell.totalPrc.text = "Cart is Empty"
                cell.totalLbl.text = "Please add"
            } else{
                cell.totalLbl.text = "Total"
                cell.totalPrc.text = "Rs. \(amt)"
            }
            
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == self.cartViewModel.products.count
        {
            return 120
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: ""){ (action , view , success ) in
            
            let item = self.cartViewModel.products[indexPath.row]
            let total = UserDefaults.standard.integer(forKey: "CartAmt")
            UserDefaults.standard.set(total - (item.product.cost*item.quantity), forKey: "CartAmt")
            self.deleteCartModel.deleteCart(cartreq: DelCartRequest(product_id: item.product_id))
            self.cartViewModel.products.remove(at: indexPath.row)
            self.cartTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            self.cartTableView.reloadData()
        }
        let theImage: UIImage? = UIImage(named:"delete")?.withRenderingMode(.alwaysOriginal)
        delete.backgroundColor = .white
        delete.image = theImage

        let swipeActions = UISwipeActionsConfiguration(actions: [delete])
        return swipeActions
    }
    
}
