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
    
    @IBOutlet weak var resetPass: UIButton!
    
    var userDetailsViewModel = UserDetailsViewModel()
    var editProfileVM = EditProfileVM()
    var btnValue = false
    let sb = UIStoryboard(name: "Main", bundle: nil)
    var fName: String!
    var lName: String!
    var eId: String!
    var pNum: String!
    var dob: String!
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
        fName = firstName.text
        lName = lastName.text
        eId = emailId.text
        pNum = phoneNumber.text
        dob = dateOfBirth.text
        let userN = UserDefaults.standard.string(forKey: "username")
        if let imageData = UserDefaults.standard.object(forKey: "UserImage of \(String(describing: userN))") as? Data,
                    let image = UIImage(data: imageData) {
                    //profilePic.image = image
            profilePic.maskCircle(anyImage: image)
        } else {
            profilePic.maskCircle(anyImage: UIImage(named: "user_male")!)
        }
        editProfile.changeView()
        
        let req = ProdRequest(product_category_id: 1, limit: 10, page: 1)
        //amountView.isHidden = true
        initViewModel(req: req)
        observeEvent()
    }

    @IBAction func editProfileClick(_ sender: Any) {
        if btnValue == false {
            self.firstName.isUserInteractionEnabled = true
            self.lastName.isUserInteractionEnabled = true
            self.emailId.isUserInteractionEnabled = true
            self.dateOfBirth.isUserInteractionEnabled = true
            self.phoneNumber.isUserInteractionEnabled = true
            self.editProfile.setTitle("SUBMIT", for: .normal)
            addBtn(btnValue: btnValue)
            btnValue = true
        } else {
            clickedSubmit()
            self.firstName.isUserInteractionEnabled = false
            self.lastName.isUserInteractionEnabled = false
            self.emailId.isUserInteractionEnabled = false
            self.dateOfBirth.isUserInteractionEnabled = false
            self.phoneNumber.isUserInteractionEnabled = false
            self.editProfile.setTitle("EDIT PROFILE", for: .normal)
            addBtn(btnValue: btnValue)
            btnValue = false
            
        }
//        let editProfileVC = sb.instantiateViewController(withIdentifier: "editAccount")
//        self.navigationController?.pushViewController(editProfileVC, animated: true)
    }
    
    @IBAction func resetPass(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let ResetVC = sb.instantiateViewController(withIdentifier: "resetPassVC")
        self.navigationController?.pushViewController(ResetVC, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationItem.backButtonTitle = ""
    }
    @objc func searchClicked(){
        
    }
    
    @objc func editImgBtn(){
        print("edit image clicked")
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
