//
//  TableProdViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 08/07/24.
//

import UIKit

class ChairProdViewController: UIViewController {

    @IBOutlet weak var chairTblView: UITableView!
    var chairViewModel = ChairProdViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.navigationItem.title = "Chairs"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
        
        chairTblView.delegate = self
        chairTblView.dataSource = self
        
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        chairTblView.register(nib, forCellReuseIdentifier: "ProductTableViewCell")
        
        let req = ProdRequest(product_category_id: 1, limit: 10, page: 1)
//        tabViewModel.fetchProducts(dataTab: req)
        initViewModel(req: req)
        observeEvent()
        
    }

    @objc func searchClicked(){
        
    }
    
    func initViewModel(req: ProdRequest){
        chairViewModel.fetchProducts(dataTab: req)
    }
    
    func observeEvent(){
        chairViewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading:
                print("Loading...")
            case .stopLoading:
                print("Loading stopped...")
            case .dataLoaded:
                print("Data Loaded...")
                print(self.chairViewModel.products)
                DispatchQueue.main.async {
                    self.chairTblView.reloadData()
                }
            case .error(let error):
                print(error ?? "")
            }
        }
    }
}

