//
//  TableProdViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 08/07/24.
//

import UIKit

class TableProdViewController: UIViewController {

    private var tabViewModel = TableProdViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.navigationItem.title = "Table"
        
        let req = TableRequest(product_category_id: 1, limit: 10, page: 1)
        tabViewModel.fetchProducts(dataTab: req)
        DispatchQueue.main.async {
            print(self.tabViewModel.products)
        }
        
    }

}
