//
//  CartViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 10/07/24.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalCartPrc: UILabel!
    var cartViewModel = ListCartViewModel()
    var tb = CartViewModel.products
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "My Cart"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
        //tb = cartViewModel.products
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        let nib = UINib(nibName: "CartTableViewCell", bundle: nil)
        cartTableView.register(nib, forCellReuseIdentifier: "CartTableViewCell")
        
        let req = CartRequest(product_id: 1, quantity: 1)
        initViewModel(req: req)
        observeEvent()
        
    }

    func initViewModel(req: CartRequest){
        cartViewModel.fetchCart(dataTab: req)
    }
    
    func observeEvent(){
        cartViewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading:
                print("Loading...")
            case .stopLoading:
                print("Loading stopped...")
            case .dataLoaded:
                print("Data Loaded...")
                print(self.cartViewModel.products)
                DispatchQueue.main.async {
                    self.cartTableView.reloadData()
                }
            case .error(let error):
                print(error ?? "")
            }
        }
    }
    @objc func searchClicked(){
        
    }
}
