//
//  CartViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 10/07/24.
//

import UIKit

enum quantityList: Int, CaseIterable{
    case one = 1
    case two = 2
    case three = 3
    case four = 4
}

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
    
    private var pickerView: UIPickerView = {
        var picker = UIPickerView()
        return picker
    }()

    
    private lazy var toolBar: UIToolbar = {
        var toolbar = UIToolbar()
        let cancelBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain,target: self, action: #selector(cancel(_:)))
        let doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,target: self, action: #selector(done(_:)))
        
        toolbar.items = [cancelBarButtonItem, doneBarButtonItem]
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        
        
        return toolbar
    }()
    
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
        setUpPickerView()
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
    private func setUpPickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
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
    
    @objc func done(_ sender: UIBarButtonItem) {
        let row = pickerView.selectedRow(inComponent: 0)
        //education.text = quantityList.allCases[row].rawValue
        view.endEditing(true)
    }

    @objc func cancel(_ sender: UIBarButtonItem) {
        view.endEditing(true)
    }
    
    
}
