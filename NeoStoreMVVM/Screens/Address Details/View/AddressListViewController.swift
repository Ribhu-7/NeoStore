//
//  AddressListViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 16/07/24.
//

import UIKit

class AddressListViewController: UIViewController{
    
    var arr = UserDefaults.standard.array(forKey: "Address") ?? []
    
    var finalAddress : String?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Address List"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addClicked))
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "AddressListCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "AddressListCell")
        

    }
    
    @objc func addClicked(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let addAddress = sb.instantiateViewController(withIdentifier: "addAddress")
        self.navigationController?.pushViewController(addAddress, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationItem.backButtonTitle = ""
    }

    @IBAction func saveAddress(_ sender: Any) {
        let logs = OrderRequest(address: finalAddress ??  "")
        print(finalAddress ?? "")
        self.orderRequest(logs: logs)
    }
    
}
