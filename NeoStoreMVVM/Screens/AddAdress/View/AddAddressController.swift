//
//  AddAddressController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 17/07/24.
//

import UIKit

class AddAddressController: UIViewController {

    @IBOutlet weak var addressField: UITextField!
    
    @IBOutlet weak var landmark: UITextField!
    
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var state: UITextField!
    
    
    @IBOutlet weak var zipCode: UITextField!
    
    @IBOutlet weak var country: UITextField!
    
    @IBOutlet weak var addressBtn: UIButton!
    
    var AddressArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        zipCode.keyboardType = .numberPad
        self.navigationItem.title = "Add Address"
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
        addressBtn.changeView()
        AddressArr = UserDefaults.standard.stringArray(forKey: "Address") ?? []
        print(AddressArr)
        
    }
    
    @IBAction func saveAddress(_ sender: Any) {
        if let address = self.addressField.text  {
            AddressArr.append(address)
            UserDefaults.standard.set(AddressArr, forKey: "Address")
        }
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let addressList = sb.instantiateViewController(withIdentifier: "addressList")
        self.navigationController?.pushViewController(addressList, animated: true)
    
        //print("Address Arr::::::",AddressArr)
    }
    
    @objc func searchClicked(){
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationItem.backButtonTitle = ""
    }
}
