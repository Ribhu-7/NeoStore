//
//  ProductViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 23/07/24.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var prodTblView: UITableView!
    var prodCatId: Int!
    var prodViewModel = ProductViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(prodCatId ?? 0)
        let req = ProdRequest(product_category_id: prodCatId ?? 0, limit: 10, page: 1)
//        tabViewModel.fetchProducts(dataTab: req)
        
        if prodCatId == 1{
            self.navigationItem.title = "Table"
            initViewModel(req: req, id: 1)
            observeEvent()
        } else if prodCatId == 2{
            self.navigationItem.title = "Chair"
            initViewModel(req: req, id: 2)
            observeEvent()
        } else if prodCatId == 3{
            self.navigationItem.title = "Sofa"
            initViewModel(req: req, id: 3)
            observeEvent()
        } else if prodCatId == 4{
            self.navigationItem.title = "Cupboard"
            initViewModel(req: req, id: 4)
            observeEvent()
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
        prodTblView.delegate = self
        prodTblView.dataSource = self
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        prodTblView.register(nib, forCellReuseIdentifier: "ProductTableViewCell")
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.backButtonTitle = ""
    }
    @objc func searchClicked(){
        
    }

    func initViewModel(req: ProdRequest,id: Int){
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
                    self.prodTblView.reloadData()
                }
            case .error(let error):
                print(error ?? "")
            }
        }
    }
}

