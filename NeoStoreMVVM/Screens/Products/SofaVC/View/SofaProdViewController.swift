//
//  SofaProdViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 08/07/24.
//

import UIKit

class SofaProdViewController: UIViewController {
   
    var sofaViewModel = SofaProdViewModel()

    @IBOutlet weak var sofaTblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        sofaTblView.delegate = self
        sofaTblView.dataSource = self
        
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        sofaTblView.register(nib, forCellReuseIdentifier: "ProductTableViewCell")
        let req = ProdRequest(product_category_id: 1, limit: 10, page: 1)
        initViewModel(req: req)
        observeEvent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.backButtonTitle = ""
    }
    
    func initViewModel(req: ProdRequest){
        sofaViewModel.fetchProducts(dataTab: req)
    }
    
    func observeEvent(){
        sofaViewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading:
                print("Loading...")
            case .stopLoading:
                print("Loading stopped...")
            case .dataLoaded:
                print("Data Loaded...")
                print(self.sofaViewModel.products)
                DispatchQueue.main.async {
                    self.sofaTblView.reloadData()
                }
            case .error(let error):
                print(error ?? "")
            }
        }
    }
    

}
