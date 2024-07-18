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
        return self.orderDetailsVM.details?.order_details?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = orderDetTblView.dequeueReusableCell(withIdentifier: "OrderDetailsViewCell") as! OrderDetailsViewCell
        let od = self.orderDetailsVM.details?.order_details?[indexPath.row]
        cell.prodName.text = "rg"
        return cell
    }
    
    
}
