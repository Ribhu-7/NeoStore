//
//  SideViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 05/07/24.
//

import UIKit

protocol SideViewControllerDelegate {
    func hideSideMenu()
}

class SideViewController: UIViewController {
    
    var delegate: SideViewControllerDelegate?

    var sideItems = ["My Cart","Tables","Sofas","Chairs","Cupboards","My Account","Store Locator","My Orders","Logout"]
    var sideImgItems = ["shoppingcart_icon","tables_icon","sofa_icon","chair_icon","cupboard_icon","username_icon","storelocator_icon","myorders_icon","logout_icon"]
    
    
    @IBOutlet weak var sideImageView: UIImageView!
    
    @IBOutlet weak var sideTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sideTableView.delegate = self
        sideTableView.dataSource = self
        sideImageView.maskCircle(anyImage: (UIImage(named: "user_male")!))
        
        let nib = UINib(nibName: "SideTableViewCell", bundle: nil)
        sideTableView.register(nib, forCellReuseIdentifier: "SideTableViewCell")
        self.sideTableView.allowsSelection = true
        //print(sideTableView.isUserInteractionEnabled)
    }
    
//    @IBAction func clickOnButton(_ sender: Any){
//        self.delegate?.hideSideMenu()
//    }


}
