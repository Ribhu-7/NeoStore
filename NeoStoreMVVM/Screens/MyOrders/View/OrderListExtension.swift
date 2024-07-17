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
        return cell
    }
    
    
}
