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
        cell.selectionStyle = .none
        cell.prodDesc.text = tb.producer
        cell.prodPrice.text = "Rs. \(tb.cost)"
        cell.prodRating.setStarRating(rating: tb.rating)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let prodVC = sb.instantiateViewController(withIdentifier: "ProductListViewController") as! ProductListViewController
        let tb = self.tabViewModel.products[indexPath.row]
        prodVC.navigationItem.title = tb.name
        prodVC.prodHead = tb.name
        prodVC.prodDes = tb.producer
        prodVC.prodCatg = "Category - Tables"
        prodVC.prodRate = tb.rating
        prodVC.prodPrc = "Rs \(tb.cost)"
        prodVC.prodImg = tb.product_images
        prodVC.prodID = tb.id
        self.navigationController?.pushViewController(prodVC, animated: true)
    }
}
