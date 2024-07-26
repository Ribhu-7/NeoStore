//
//  EditAccountController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 15/07/24.
//

import UIKit

class EditAccountController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    @IBOutlet weak var editImage: UIImageView!
    
    //@IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var editFname: UITextField!
    
    
    @IBOutlet weak var editLname: UITextField!
    
    @IBOutlet weak var editEmail: UITextField!
    
    
    @IBOutlet weak var editPhone: UITextField!
    
    
    @IBOutlet weak var editDob: UITextField!
    
    
    @IBOutlet weak var submitBtn: UIButton!
    
    @IBOutlet weak var resetPass: UIButton!
    //var editAccountModel = EditAccountModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Edit Profile"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
        
        configuration()
        //scrollView.contentSize = CGSizeMake(self.view.frame.width, self.view.frame.height+100)

    }
    
    func configuration(){
        editFname.setContent("First Name", "username_icon")
        editLname.setContent("Last Name", "username_icon")
        editEmail.setContent("Email", "email_icon")
        editPhone.setContent("Phone Number", "email_icon")
        editDob.setContent("DOB", "dob_icon")
        editImage.maskCircle(anyImage: (UIImage(named: "user_male")!))
        submitBtn.changeView()
        resetPass.changeView()
       
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
        //self.navigationController?.popViewController(animated: true)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let HomeVC = sb.instantiateViewController(withIdentifier: "HomeVC")
        self.navigationController?.pushViewController(HomeVC, animated: true)
        
    }
    
    @IBAction func resetPass(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let ResetVC = sb.instantiateViewController(withIdentifier: "resetPassVC")
        self.navigationController?.pushViewController(ResetVC, animated: true)
    }
    
    @IBAction func editImgBtn(_ sender: Any) {
        let ac = UIAlertController(title: "Select Image", message: "from ", preferredStyle: .actionSheet)
        
        let cameraBtn = UIAlertAction(title: "Camera", style: .default)
        { [weak self]
            (_) in print("camera pressed")
            self?.showImagePicker(selectedSource: .camera)
        }
        
        let libraryBtn = UIAlertAction(title: "Library", style: .default){
            [weak self]
            (_) in print("library pressed")
            self?.showImagePicker(selectedSource: .photoLibrary)
        }
        
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel){
            (_) in print("cancel pressed")
        }
        
        ac.addAction(cameraBtn)
        ac.addAction(libraryBtn)
        ac.addAction(cancelBtn)
        self.present(ac, animated: true)
    }
    func showImagePicker(selectedSource: UIImagePickerController.SourceType){
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else {
            print("Selected source not there")
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = selectedSource
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage{
            editImage.image = selectedImage
            let userN = UserDefaults.standard.string(forKey: "username")
            if let pngRepresentation = selectedImage.pngData() {
                UserDefaults.standard.set(pngRepresentation, forKey: "UserImage of \(String(describing: userN))")
                }
        } else {
            print("image not found")
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
