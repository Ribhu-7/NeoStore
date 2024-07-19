//
//  CartViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 10/07/24.
//

import UIKit

protocol CartViewControllerDelegate {
    func showCartMenu()
}
class CartViewController: UIViewController {
    
//    @IBOutlet weak var amountTableView: UITableView!
//    @IBOutlet weak var amountView: UIView!
    var delegate: CartViewControllerDelegate?
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalCartPrc: UILabel!
    var cartViewModel = ListCartViewModel()
    var deleteCartModel = DeleteCartViewModel()
    var totalCartAmt = 0
    var a = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "My Cart"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
        //tb = cartViewModel.products
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
//        amountTableView.delegate = self
//        amountTableView.dataSource = self
        let nib = UINib(nibName: "CartTableViewCell", bundle: nil)
        cartTableView.register(nib, forCellReuseIdentifier: "CartTableViewCell")
        
        let nib1 = UINib(nibName: "AmountTableViewCell", bundle: nil)
        cartTableView.register(nib1, forCellReuseIdentifier: "AmountTableViewCell")
        
        let req = CartRequest(product_id: 1, quantity: 0)
        //amountView.isHidden = true
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
                //print(self.cartViewModel.products)
                print(self.cartViewModel.products.count)
                DispatchQueue.main.async {
                    self.cartTableView.reloadData()
//                    self.amountTableView.reloadData()
//                    self.totalCartAmt = 0
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
    
    @IBAction func orderNow(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let arr = UserDefaults.standard.stringArray(forKey: "Address") ?? []
        if arr.count != 0 {
            let addressList = sb.instantiateViewController(withIdentifier: "addressList")
            self.navigationController?.pushViewController(addressList, animated: true)
           
        } else {
            let addAddress = sb.instantiateViewController(withIdentifier: "addAddress")
            self.navigationController?.pushViewController(addAddress, animated: true)
        }
    }
    
}
