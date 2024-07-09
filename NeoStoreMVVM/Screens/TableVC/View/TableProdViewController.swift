//
//  TableProdViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 08/07/24.
//

import UIKit

class TableProdViewController: UIViewController {

    @IBOutlet weak var TBtableView: UITableView!
    var tabViewModel = TableProdViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
        
        TBtableView.delegate = self
        TBtableView.dataSource = self
        
        let nib = UINib(nibName: "ProdTableViewCell", bundle: nil)
        TBtableView.register(nib, forCellReuseIdentifier: "ProdTableViewCell")
        
        let req = TableRequest(product_category_id: 1, limit: 10, page: 1)
//        tabViewModel.fetchProducts(dataTab: req)
        initViewModel(req: req)
        observeEvent()
        
    }

    @objc func searchClicked(){
        
    }
    
    func initViewModel(req: TableRequest){
        tabViewModel.fetchProducts(dataTab: req)
    }
    
    func observeEvent(){
        tabViewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading:
                print("Loading...")
            case .stopLoading:
                print("Loading stopped...")
            case .dataLoaded:
                print("Data Loaded...")
                print(self.tabViewModel.products)
                DispatchQueue.main.async {
                    self.TBtableView.reloadData()
                }
            case .error(let error):
                print(error ?? "")
            }
        }
    }
}

