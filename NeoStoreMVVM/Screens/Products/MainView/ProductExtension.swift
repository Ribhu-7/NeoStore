//
//  TableProdExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 09/07/24.
//

import Foundation
import UIKit

extension ProductViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.prodViewModel.products.count
        //return self.filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = prodTblView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
        let tb = self.prodViewModel.products[indexPath.row]
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
        //let ratingVC = sb.instantiateViewController(withIdentifier: "productRating") as! ProductRatingController
        let tb = self.prodViewModel.products[indexPath.row]
        prodVC.navigationItem.title = tb.name
        prodVC.prodHead = tb.name
        prodVC.prodDes = tb.producer
        if self.prodCatId == 1{
            prodVC.prodCatg = "Category - Tables"
        } else if self.prodCatId == 2{
            prodVC.prodCatg = "Category - Chair"
        } else if self.prodCatId == 3{
            prodVC.prodCatg = "Category - Sofa"
        } else if self.prodCatId == 4{
            prodVC.prodCatg = "Category - Cupboard"
        }
        
        prodVC.prodRate = tb.rating
        prodVC.prodPrc = "Rs \(tb.cost)"
        prodVC.prodImg = tb.product_images
        prodVC.prodID = tb.id
        prodVC.prodViewCount =  tb.view_count
//        ratingVC.prodLbl = tb.name
//        ratingVC.prodRate = tb.rating
//        ratingVC.prodImg = tb.product_images
        self.navigationController?.pushViewController(prodVC, animated: true)
    }
}
