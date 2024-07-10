//
//  SideVCExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 05/07/24.
//

import Foundation
import UIKit

extension SideViewController :  UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideTableViewCell", for: indexPath) as! SideTableViewCell
        
        cell.sideImg.image = UIImage(named: sideImgItems[indexPath.row])
        cell.sideLbl.text = sideItems[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    
    }
    
}
