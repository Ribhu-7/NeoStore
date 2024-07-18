//
//  OrderListExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 17/07/24.
//

import Foundation
import UIKit

extension OrderListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.orderListViewModel.details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = orderTblView.dequeueReusableCell(withIdentifier: "OrderListViewCell", for: indexPath) as! OrderListViewCell
        let od = self.orderListViewModel.details[indexPath.row]
        cell.orderId.text = String(od.id)
        cell.orderDate.text = od.created
        cell.orderAmt.text = String(od.cost)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let od = self.orderListViewModel.details[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let orderDetails = sb.instantiateViewController(withIdentifier: "orderDetails") as! OrderDetailsViewController
        orderDetails.orderDetailsId = od.id
        self.navigationController?.pushViewController(orderDetails, animated: true)
    }
}
