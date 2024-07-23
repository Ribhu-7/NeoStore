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
    var prodViewModel = ProductViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
        
        TBtableView.delegate = self
        TBtableView.dataSource = self
        
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        TBtableView.register(nib, forCellReuseIdentifier: "ProductTableViewCell")
        
        let req = ProdRequest(product_category_id: 1, limit: 10, page: 1)
//        tabViewModel.fetchProducts(dataTab: req)
        initViewModel(req: req, id: 1)
        observeEvent()
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.backButtonTitle = ""
    }
    
    @objc func searchClicked(){
        
    }
    
    func initViewModel(req: ProdRequest, id: Int){
        //tabViewModel.fetchProducts(dataTab: req)
        prodViewModel.fetchProducts(dataTab: req, id: id)
    }
    
    func observeEvent(){
        prodViewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading:
                print("Loading...")
            case .stopLoading:
                print("Loading stopped...")
            case .dataLoaded:
                print("Data Loaded...")
                print(self.prodViewModel.products)
                DispatchQueue.main.async {
                    self.TBtableView.reloadData()
                }
            case .error(let error):
                print(error ?? "")
            }
        }
    }
}

