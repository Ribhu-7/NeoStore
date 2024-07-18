//
//  OrderDetailsViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 18/07/24.
//

import UIKit

class OrderDetailsViewController: UIViewController {

    @IBOutlet weak var orderDetTblView: UITableView!
    var orderDetailsId: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        orderDetTblView.dataSource = self
        orderDetTblView.delegate = self
        self.navigationItem.title = "OrderId: \(orderDetailsId ?? 0)"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
    }

    @objc func searchClicked(){
        
    }
}
