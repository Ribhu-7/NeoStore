//
//  MyAccountViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 12/07/24.
//

import UIKit

class MyAccountViewController: UIViewController {

    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var emailId: UITextField!
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var dateOfBirth: UITextField!
    
    @IBOutlet weak var editProfile: UIButton!
    
    var userDetailsViewModel = UserDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "My Account"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
        firstName.setContent("", "username_icon")
        lastName.setContent("", "username_icon")
        emailId.setContent("", "email_icon")
        phoneNumber.setContent("", "email_icon")
        dateOfBirth.setContent("", "dob_icon")
        profilePic.maskCircle(anyImage: (UIImage(named: "user_male")!))
        editProfile.changeView()
        
        let req = ProdRequest(product_category_id: 1, limit: 10, page: 1)
        //amountView.isHidden = true
        initViewModel(req: req)
        observeEvent()
    }

    @IBAction func editProfileClick(_ sender: Any) {
        
    }
    
    @IBAction func resetPass(_ sender: Any) {
        
    }
    
    @objc func searchClicked(){
        
    }
    
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
                DispatchQueue.main.async {
                    self.firstName.text = self.userDetailsViewModel.details?.user_data?.first_name
                    self.lastName.text = self.userDetailsViewModel.details?.user_data?.last_name
                    self.emailId.text = self.userDetailsViewModel.details?.user_data?.email
                    self.phoneNumber.text = self.userDetailsViewModel.details?.user_data?.phone_no
                   
                    self.dateOfBirth.text = self.userDetailsViewModel.details?.user_data?.dob ?? ""
                    
                }
            case .error(let error):
                print(error ?? "")
            }
        }
        
    }
}
