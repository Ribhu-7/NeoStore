//
//  AddressListExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 17/07/24.
//

import Foundation
import UIKit

extension AddressListViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressListCell") as! AddressListCell
      
        cell.addressHead.text = UserDefaults.standard.string(forKey: "fullname")
        cell.addressDesc.text = arr[indexPath.row] as? String
        cell.btnImage.image = UIImage(systemName: "circle")
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell = tableView.cellForRow(at: indexPath) as! AddressListCell
        if cell.isCheck == false {
            cell.isCheck = true
            cell.btnImage.image = UIImage(systemName: "circle.inset.filled")
        }
        let address = arr[indexPath.row] as? String
        print(address ?? "")
        guard let address1 = address else {
            return
        }
        self.finalAddress = address1
       
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! AddressListCell
        cell.btnImage.image = UIImage(systemName: "circle")
        cell.isCheck = false
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: ""){ (action , view , success ) in
            self.arr.remove(at: indexPath.row)
            var addressArray = UserDefaults.standard.array(forKey: "Address")
            addressArray?.remove(at: indexPath.row)
            UserDefaults.standard.set(addressArray, forKey: "Address")
            self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            self.tableView.reloadData()
        }
        let theImage: UIImage? = UIImage(named:"delete")?.withRenderingMode(.alwaysOriginal)
        //delete.backgroundColor = .white
        delete.backgroundColor = UIColor.white
        delete.image = theImage

        let swipeActions = UISwipeActionsConfiguration(actions: [delete])
        return swipeActions
    }
}
