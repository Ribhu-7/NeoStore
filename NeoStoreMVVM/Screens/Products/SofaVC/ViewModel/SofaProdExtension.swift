//
//  TableProdExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 09/07/24.
//

import Foundation
import UIKit

extension SofaProdViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sofaViewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sofaTblView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        let tb = self.sofaViewModel.products[indexPath.row]
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
        //let ratingVC = sb.instantiateViewController(withIdentifier: "productRating") as! ProductRatingController
        let tb = self.sofaViewModel.products[indexPath.row]
        prodVC.navigationItem.title = tb.name
        prodVC.prodHead = tb.name
        prodVC.prodDes = tb.producer
        prodVC.prodCatg = "Category - Sofa"
        prodVC.prodRate = tb.rating
        prodVC.prodPrc = "Rs \(tb.cost)"
        prodVC.prodImg = tb.product_images
        prodVC.prodViewCount =  tb.view_count
        //let idd = UserDefaults.standard.integer(forKey: "prodRating \(tb.id)") 
        prodVC.prodID = tb.id
//        ratingVC.prodLbl = tb.name
//        ratingVC.prodRate = tb.rating
//        ratingVC.prodImg = tb.product_images
        self.navigationController?.pushViewController(prodVC, animated: true)
    }
}
