//
//  OrderDetailsExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 18/07/24.
//

import Foundation
import UIKit

extension OrderDetailsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
