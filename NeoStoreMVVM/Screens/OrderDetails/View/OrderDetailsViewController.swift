//
//  OrderDetailsViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 18/07/24.
//

import UIKit

class OrderDetailsViewController: UIViewController {

    @IBOutlet weak var orderDetTblView: UITableView!
    var orderDetailsId: Int?
    var orderDetailsVM = OrderDetailsVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        orderDetTblView.dataSource = self
        orderDetTblView.delegate = self
        self.navigationItem.title = "OrderId: \(orderDetailsId ?? 0)"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
        let req = OrderDetailsRequest(order_id: orderDetailsId ?? 0)
        //amountView.isHidden = true
        let nib = UINib(nibName: "OrderDetailsViewCell", bundle: nil)
        orderDetTblView.register(nib, forCellReuseIdentifier: "OrderDetailsViewCell")
        
        let nib1 = UINib(nibName: "AmountTableViewCell", bundle: nil)
        orderDetTblView.register(nib1, forCellReuseIdentifier: "AmountTableViewCell")
        
        initViewModel(req: req, id: orderDetailsId!)
        observeEvent()
        
    }

    func initViewModel(req: OrderDetailsRequest , id: Int){
        orderDetailsVM.getOrderDetails(dataTab: req, id: id)
    }
    func observeEvent(){
        orderDetailsVM.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading:
                print("Loading...")
            case .stopLoading:
                print("Loading stopped...")
            case .dataLoaded:
                print("Data Loaded...")
                //print(self.userDetailsViewModel.details)
                DispatchQueue.main.async {
                    self.orderDetTblView.reloadData()
                    
                }
            case .error(let error):
                print(error ?? "")
            }
        }
    }

    @objc func searchClicked(){
        
    }
}
