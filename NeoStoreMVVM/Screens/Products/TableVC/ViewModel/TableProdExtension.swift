//
//  TableProdExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 09/07/24.
//

import Foundation
import UIKit

extension TableProdViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tabViewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TBtableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
        let tb = self.tabViewModel.products[indexPath.row]
        cell.prodTblImg.setImage(with: tb.product_images)
        cell.prodHeading.text = tb.name
        cell.prodDesc.text = tb.producer
        cell.prodPrice.text = "Rs. \(tb.cost)"
        cell.prodRating.setStarRating(rating: tb.rating)
        return cell
    }
}
