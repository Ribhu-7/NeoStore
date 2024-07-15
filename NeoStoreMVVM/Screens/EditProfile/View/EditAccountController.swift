//
//  EditAccountController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 15/07/24.
//

import UIKit

class EditAccountController: UIViewController {

    
    @IBOutlet weak var editImage: UIImageView!
    
    
    @IBOutlet weak var editFname: UITextField!
    
    
    @IBOutlet weak var editLname: UITextField!
    
    @IBOutlet weak var editEmail: UITextField!
    
    
    @IBOutlet weak var editPhone: UITextField!
    
    
    @IBOutlet weak var editDob: UITextField!
    
    
    @IBOutlet weak var submitBtn: UIButton!
    
    //var editAccountModel = EditAccountModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Edit Profile"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
        
        configuration()
    }
    
    func configuration(){
        editFname.setContent("First Name", "username_icon")
        editLname.setContent("Last Name", "username_icon")
        editEmail.setContent("Email", "email_icon")
        editPhone.setContent("Phone Number", "email_icon")
        editDob.setContent("DOB", "dob_icon")
        editImage.maskCircle(anyImage: (UIImage(named: "user_male")!))
        submitBtn.changeView()
        
       
//        let req = Request(product_category_id: 1, limit: 10, page: 1)
        
        
        //initViewModel(req: req)
//        observeEvent()
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.navigationItem.backButtonTitle = ""
    }
    
    @objc func searchClicked(){
        
    }

    
    @IBAction func onSubmit(_ sender: Any) {
        guard let fname = editFname.text else {return}
        guard let lname = editLname.text else {return}
        guard let email = editEmail.text else {return}
        guard let phone = editPhone.text else {return}
        guard let dob = editDob.text else {return}
        let req = EditRequest(first_name: fname, last_name: lname, email: email, dob: dob, profile_pic: "",  phone_no: phone)
        self.editRequest(logs: req)
    }
    
    @IBAction func resetPass(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let ResetVC = sb.instantiateViewController(withIdentifier: "resetPassVC")
        self.navigationController?.pushViewController(ResetVC, animated: true)
    }
    
}
