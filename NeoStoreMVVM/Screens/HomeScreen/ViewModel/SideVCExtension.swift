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
        let cnt = UserDefaults.standard.integer(forKey: "CartTotal")
        if indexPath.row == 0 {
            let total = UserDefaults.standard.integer(forKey: "CartTotal")
            if total != 0 {
                cell.sideCartBtn.isHidden = false
                cell.sideCartBtn.layer.cornerRadius = 0.5 * cell.sideCartBtn.bounds.size.width
                cell.sideCartBtn.clipsToBounds = true
                print("Count of cart: ",cnt)
                cell.sideCartBtn.setTitle(String(cnt), for: .normal)
            } else {
                cell.sideCartBtn.isHidden = true
            }
        } else {
            cell.sideCartBtn.isHidden = true
        }
        cell.sideImg.image = UIImage(named: sideImgItems[indexPath.row])
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
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let productVC = sb.instantiateViewController(withIdentifier: "productVC") as! ProductViewController
        sideTableView.alpha = 1.0
        if indexPath.row == 0 {
            let cartVC = sb.instantiateViewController(withIdentifier: "cartVC")
            self.navigationController?.pushViewController(cartVC, animated: true)
        } else if indexPath.row == 1 {
            productVC.prodCatId = 1
            self.navigationController?.pushViewController(productVC, animated: true)
        } else if indexPath.row == 2 {
            productVC.prodCatId = 3
            self.navigationController?.pushViewController(productVC, animated: true)
        } else if indexPath.row == 3 {
            productVC.prodCatId = 2
            self.navigationController?.pushViewController(productVC, animated: true)
        } else if indexPath.row == 4 {
            productVC.prodCatId = 4
            self.navigationController?.pushViewController(productVC, animated: true)
        } else if indexPath.row == 5{
            let myaccountVC = sb.instantiateViewController(withIdentifier: "myaccountVC")
            self.navigationController?.pushViewController(myaccountVC, animated: true)
        } else if indexPath.row == 6 {
            let storeVC = sb.instantiateViewController(withIdentifier: "storeVC")
            self.navigationController?.pushViewController(storeVC, animated: true)
        } else if indexPath.row == 7 {
            let orderList = sb.instantiateViewController(withIdentifier: "orderList")
            self.navigationController?.pushViewController(orderList, animated: true)
            print("clicked")
            
        } else if indexPath.row == 8 {
            UserDefaults.standard.removeObject(forKey: "username")
            UserDefaults.standard.removeObject(forKey: "password")
            let loginVC = sb.instantiateViewController(withIdentifier: "LoginVC")
            self.navigationController?.pushViewController(loginVC, animated: true)
            print("loginVC")
        }
        
    }
}
