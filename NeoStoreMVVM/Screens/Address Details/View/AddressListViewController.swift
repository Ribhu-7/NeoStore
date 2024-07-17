//
//  AddressListViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 16/07/24.
//

import UIKit

class AddressListViewController: UIViewController{
    
    var arr = UserDefaults.standard.array(forKey: "Address") ?? []
    
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
        
//        btnMale.setImage(UIImage.init(named: "chkn"), for: .normal)
//        btnFemale.setImage(UIImage.init(named: "chkn"), for: .normal)
//        btnMale.setImage(UIImage.init(named: "chky"), for: .selected)
    }
    
    @objc func addClicked(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let addAddress = sb.instantiateViewController(withIdentifier: "addAddress")
        self.navigationController?.pushViewController(addAddress, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationItem.backButtonTitle = ""
    }

}
