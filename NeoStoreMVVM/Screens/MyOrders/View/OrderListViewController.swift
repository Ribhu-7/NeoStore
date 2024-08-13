//
//  OrderListViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 17/07/24.
//

import UIKit

class OrderListViewController: UIViewController {

    @IBOutlet weak var orderTblView: UITableView! {
        didSet {
            orderTblView.delegate = self
            orderTblView.dataSource = self
        }
    }
    var orderListViewModel = OrderListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "My Orders"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
        
        let nib = UINib(nibName: "OrderListViewCell", bundle: nil)
        orderTblView.register(nib, forCellReuseIdentifier: "OrderListViewCell")
        
        let req = ProdRequest(product_category_id: 1, limit: 10, page: 1)
        initViewModel(req: req)
        observeEvent()
    }
    
    func initViewModel(req: ProdRequest){
        orderListViewModel.getOrder(dataTab: req)
    }
    func observeEvent(){
        orderListViewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading:
                print("Loading...")
            case .stopLoading:
                print("Loading stopped...")
            case .dataLoaded:
                print("Data Loaded...")
                DispatchQueue.main.async {
                    self.orderTblView.reloadData()
                }
            case .error(let error):
                print(error ?? "")
            }
        }
    }

    @objc func searchClicked(){
        
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.navigationItem.backButtonTitle = ""
    }
}
