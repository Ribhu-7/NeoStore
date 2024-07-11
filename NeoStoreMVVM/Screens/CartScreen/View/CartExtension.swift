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
        return self.cartViewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        
        print(tb?.data)
        cell.cartHead.text = "Ribhu"
        cell.cartDesc.text = "Ghosh"
        cell.cartPrice.text = "Rs. \(200)"
        
        return cell
    }
}
