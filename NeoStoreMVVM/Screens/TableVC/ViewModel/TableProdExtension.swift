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
        let cell = TBtableView.dequeueReusableCell(withIdentifier: "ProdTableViewCell") as! ProdTableViewCell
        let tb = self.tabViewModel.products[indexPath.row]
        cell.tabPproduct = tb
//        cell.prodTablelbl = self.tabViewModel.products.name
        return cell
    }
}
