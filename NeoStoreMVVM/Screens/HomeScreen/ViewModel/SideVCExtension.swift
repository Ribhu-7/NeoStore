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
        let cnt = self.cartViewModel.products.count
        //print(cnt)
        if indexPath.row == 0 {
            cell.sideCartBtn.isHidden = false
            cell.sideCartBtn.layer.cornerRadius = 20
            print("Count of cart: ",cnt)
            cell.sideCartBtn.setTitle(String(cnt), for: .normal)
        }
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
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if indexPath.row == 0 {
                let cartVC = sb.instantiateViewController(withIdentifier: "cartVC")
                self.navigationController?.pushViewController(cartVC, animated: true)
        } else if indexPath.row == 1 {
            let tableVC = sb.instantiateViewController(withIdentifier: "tableVC")
            self.navigationController?.pushViewController(tableVC, animated: true)
        } else if indexPath.row == 2 {
            let sofaVC = sb.instantiateViewController(withIdentifier: "sofaVC")
            self.navigationController?.pushViewController(sofaVC, animated: true)
        } else if indexPath.row == 3 {
            let chairVC = sb.instantiateViewController(withIdentifier: "chairVC")
            self.navigationController?.pushViewController(chairVC, animated: true)
        } else if indexPath.row == 4 {
            let cupboardVC = sb.instantiateViewController(withIdentifier: "cupboardVC")
            self.navigationController?.pushViewController(cupboardVC, animated: true)
        } else if indexPath.row == 5{
            let myaccountVC = sb.instantiateViewController(withIdentifier: "myaccountVC")
            self.navigationController?.pushViewController(myaccountVC, animated: true)
        } else if indexPath.row == 6 {
            let storeVC = sb.instantiateViewController(withIdentifier: "storeVC")
            self.navigationController?.pushViewController(storeVC, animated: true)
        }
        print("clicked")
        
    }
    
}
