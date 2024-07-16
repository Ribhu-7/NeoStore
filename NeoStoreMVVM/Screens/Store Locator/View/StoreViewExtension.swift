//
//  StoreViewExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 16/07/24.
//

import Foundation
import UIKit

extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell") as! StoreTableViewCell
        cell.storeHead.text = locationHead[indexPath.row]
        cell.storeAddress.text = locationDesc[indexPath.row]
        
        return cell
    }
    
    
    
    
}
