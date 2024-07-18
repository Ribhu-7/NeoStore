//
//  OrderDetailsExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 18/07/24.
//

import Foundation
import UIKit

extension OrderDetailsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cnt = self.orderDetailsVM.details?.order_details?.count ?? 0
        return cnt+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cnt = self.orderDetailsVM.details?.order_details?.count ?? 0
        
        if indexPath.row < cnt {
            let cell = orderDetTblView.dequeueReusableCell(withIdentifier: "OrderDetailsViewCell") as! OrderDetailsViewCell
            let od = self.orderDetailsVM.details?.order_details?[indexPath.row]
            cell.prodName.text = od?.prod_name
            //let amt = String(describing: od?.total)
            let amount = od?.total
            //print(amount!)
            cell.prodAmt.text = String(amount!)
            cell.prodCategory.text = od?.prod_cat_name
            let qty = od?.quantity
            cell.prodQty.text = String(qty!)
            cell.prodImg.setImage(with: od?.prod_image ?? "")
            return cell
        } else if indexPath.row == cnt {
            let cell = orderDetTblView.dequeueReusableCell(withIdentifier: "AmountTableViewCell") as! AmountTableViewCell
            let total = self.orderDetailsVM.details?.cost
            let totalAmount = total ?? 0
            cell.totalPrc.text = String(totalAmount)
            return cell
        }
      return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
