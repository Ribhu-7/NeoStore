//
//  TableProdExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 09/07/24.
//

import Foundation
import UIKit

extension ChairProdViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chairViewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chairTblView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
        let tb = self.chairViewModel.products[indexPath.row]
        cell.prodTblImg.setImage(with: tb.product_images)
        cell.prodHeading.text = tb.name
        cell.prodDesc.text = tb.producer
        cell.prodPrice.text = "Rs. \(tb.cost)"
        cell.prodRating.setStarRating(rating: tb.rating)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let prodVC = sb.instantiateViewController(withIdentifier: "ProductListViewController") as! ProductListViewController
        let tb = self.chairViewModel.products[indexPath.row]
        prodVC.navigationItem.title = tb.name
        prodVC.prodHead = tb.name
        prodVC.prodDes = tb.producer
        prodVC.prodCatg = "Category - Chair"
        prodVC.prodRate = tb.rating
        self.navigationController?.pushViewController(prodVC, animated: true)
    }
}
