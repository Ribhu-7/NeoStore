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
        //print(cell.isUserInteractionEnabled)
        cell.sideLbl.text = sideItems[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for recognizer in sideTableView.gestureRecognizers ?? [] {
            recognizer.cancelsTouchesInView = false
        }
        sideTableView.alpha = 1.0
        
        if indexPath.row == 0 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
                let cartVC = sb.instantiateViewController(withIdentifier: "cartVC")
                self.navigationController?.pushViewController(cartVC, animated: true)
            
        }
        print("clicked")
        
    }
    
}
