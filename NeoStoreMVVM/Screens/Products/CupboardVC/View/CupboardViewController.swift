//
//  CupboardViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 08/07/24.
//

import UIKit

class CupboardViewController: UIViewController {

    @IBOutlet weak var cupbTblView: UITableView!
    var cupBViewModel = CupboardViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
        
        cupbTblView.delegate = self
        cupbTblView.dataSource = self
        
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        cupbTblView.register(nib, forCellReuseIdentifier: "ProductTableViewCell")
        
        let req = ProdRequest(product_category_id: 1, limit: 10, page: 1)
//        tabViewModel.fetchProducts(dataTab: req)
        initViewModel(req: req)
        observeEvent()
        
    }

    @objc func searchClicked(){
        
    }
    
    func initViewModel(req: ProdRequest){
        cupBViewModel.fetchProducts(dataTab: req)
    }
    
    func observeEvent(){
        cupBViewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading:
                print("Loading...")
            case .stopLoading:
                print("Loading stopped...")
            case .dataLoaded:
                print("Data Loaded...")
                print(self.cupBViewModel.products)
                DispatchQueue.main.async {
                    self.cupbTblView.reloadData()
                }
            case .error(let error):
                print(error ?? "")
            }
        }
    }

}
