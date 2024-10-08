//
//  CartViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 10/07/24.
//

import UIKit

protocol CartViewDelegate {
    func cartAdded(request:EditCartRequest)
}

class CartViewController: UIViewController {

    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalCartPrc: UILabel!
    
    var cartViewModel = ListCartViewModel()
    var deleteCartModel = DeleteCartViewModel()
    var editCartViewModel = EditCartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configuration()
    }

    func configuration() {
        
        self.activityIndicator.transform = CGAffineTransform(scaleX: 3, y: 3)
        self.activityIndicator.startAnimating()
        self.navigationItem.title = "My Cart"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "homekit"), style: .plain, target: self, action: #selector(searchClicked))
        
        cartTableView.delegate = self
        cartTableView.dataSource = self

        let nib = UINib(nibName: "CartTableViewCell", bundle: nil)
        cartTableView.register(nib, forCellReuseIdentifier: "CartTableViewCell")
        
        let nib1 = UINib(nibName: "AmountTableViewCell", bundle: nil)
        cartTableView.register(nib1, forCellReuseIdentifier: "AmountTableViewCell")
        
        let req = CartRequest(product_id: 1, quantity: 0)
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
                print(self.cartViewModel.products.count)
                DispatchQueue.main.async {
                    self.cartTableView.reloadData()
                    self.loadingView.isHidden = true
                }
            case .error(let error):
                print(error ?? "")
            }
        }
        
        editCartViewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading:
                print("Loading...")
            case .stopLoading:
                print("Loading stopped...")
            case .dataLoaded:
                print("Data Loaded...")
                DispatchQueue.main.async {
                    let req = CartRequest(product_id: 1, quantity: 0)
                    self.initViewModel(req: req)

                }
            case .error(let error):
                print(error ?? "")
            }
        }
    }
   
    @objc func searchClicked(){
        self.navigationController?.popViewController(animated: true)
     
    }
    func showCart(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let cartVC = sb.instantiateViewController(withIdentifier: "cartVC")
        self.navigationController?.pushViewController(cartVC, animated: true)
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

extension CartViewController: CartViewDelegate {
    func cartAdded(request: EditCartRequest) {
        self.editCartViewModel.editCart(dataTab: request)
    }
}
