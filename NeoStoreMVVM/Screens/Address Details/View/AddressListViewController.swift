//
//  AddressListViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 16/07/24.
//

import UIKit

class AddressListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressListCell") as! AddressListCell
        cell.addressHead.text = "Ribhu Ghosh"
        cell.addressDesc.text = "Palava,Mumbai"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Address List"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "plus"), style: .plain, target: self, action: #selector(addClicked))
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "AddressListCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "AddressListCell")
    }
    
    @objc func addClicked(){
        
    }

}
