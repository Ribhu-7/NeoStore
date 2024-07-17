//
//  OrderListViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 17/07/24.
//

import UIKit

class OrderListViewController: UIViewController {

    @IBOutlet weak var orderTblView: UITableView!
    var orderListViewModel = OrderListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "My Orders"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
        orderTblView.delegate = self
        orderTblView.dataSource = self
        let nib = UINib(nibName: "OrderListViewCell", bundle: nil)
        orderTblView.register(nib, forCellReuseIdentifier: "OrderListViewCell")
        
    }
    

    @objc func searchClicked(){
        
    }

}
