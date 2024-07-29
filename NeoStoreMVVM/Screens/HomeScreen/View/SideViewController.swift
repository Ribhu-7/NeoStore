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
protocol SideViewDelegate{
    func accountUpdate()
}

class SideViewController: UIViewController {
    
    var delegate: SideViewControllerDelegate?

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    var sideItems = ["My Cart","Tables","Sofas","Chairs","Cupboards","My Account","Store Locator","My Orders","Logout"]
    var sideImgItems = ["shoppingcart_icon","tables_icon","sofa_icon","chair_icon","cupboard_icon","username_icon","storelocator_icon","myorders_icon","logout_icon"]
    
    var cartViewModel = ListCartViewModel()
    
    var userDetailsViewModel = UserDetailsViewModel()
    @IBOutlet weak var sideImageView: UIImageView!
    
    @IBOutlet weak var sideTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sideTableView.delegate = self
        sideTableView.dataSource = self
        let userN = UserDefaults.standard.string(forKey: "username")
        self.userName.text = UserDefaults.standard.string(forKey: "fullname")
        self.userEmail.text = UserDefaults.standard.string(forKey: "username")
        if let imageData = UserDefaults.standard.object(forKey: "UserImage of \(String(describing: userN))") as? Data,
                    let image = UIImage(data: imageData) {
                    //profilePic.image = image
            sideImageView.maskCircle(anyImage: image)
        } else {
            sideImageView.maskCircle(anyImage: UIImage(named: "user_male")!)
        }
        //sideImageView.maskCircle(anyImage: (UIImage(named: "user_male")!))
        let nib = UINib(nibName: "SideTableViewCell", bundle: nil)
        sideTableView.register(nib, forCellReuseIdentifier: "SideTableViewCell")
        self.sideTableView.allowsSelection = true
        //print(sideTableView.isUserInteractionEnabled)
        let req = ProdRequest(product_category_id: 1, limit: 10, page: 1)
//        tabViewModel.fetchProducts(dataTab: req)
        initViewModel(req: req)
        observeEvent()
    }
    
//    @IBAction func clickOnButton(_ sender: Any){
//        self.delegate?.hideSideMenu()
//    }

    func initViewModel(req: ProdRequest){
        userDetailsViewModel.getDetails(dataTab: req)
    }
    
    func observeEvent(){
        userDetailsViewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading:
                print("Loading...")
            case .stopLoading:
                print("Loading stopped...")
            case .dataLoaded:
                print("Data Loaded...")
                //print(self.userDetailsViewModel.details)
//                self.sideTableView.reloadData()
                DispatchQueue.main.async {
//                    guard let userN = self.userDetailsViewModel.details?.user_data?.last_name else {return}
//                    guard let userF = self.userDetailsViewModel.details?.user_data?.first_name else {return}
//                    
//                    let fullname = userF + " " + userN
//                    UserDefaults.standard.set(fullname, forKey: "fullname")
                    self.userName.text = UserDefaults.standard.string(forKey: "fullname")
                    self.userEmail.text = UserDefaults.standard.string(forKey: "username")
                    self.sideTableView.reloadData()
                }
            case .error(let error):
                print(error ?? "")
            }
        }
    }

}

extension SideViewController: SideViewDelegate{
    func accountUpdate() {
        let userN = UserDefaults.standard.string(forKey: "username")
        self.userName.text = UserDefaults.standard.string(forKey: "fullname")
        self.userEmail.text = UserDefaults.standard.string(forKey: "username")
        if let imageData = UserDefaults.standard.object(forKey: "UserImage of \(String(describing: userN))") as? Data,
                    let image = UIImage(data: imageData) {
                    //profilePic.image = image
            sideImageView.maskCircle(anyImage: image)
        }
    }
}
