//
//  MyAccountController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 26/07/24.
//

import Foundation
import UIKit

extension MyAccountViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func addBtn(btnValue: Bool){
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .white.withAlphaComponent(0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        //button.isHidden = false
        if btnValue == false {
            self.profilePic.addSubview(button)
            NSLayoutConstraint.activate([
             button.trailingAnchor.constraint(equalTo: self.profilePic.trailingAnchor,constant: -10),
             button.bottomAnchor.constraint(equalTo: self.profilePic.bottomAnchor),
                button.widthAnchor.constraint(equalToConstant: 50),
                button.heightAnchor.constraint(equalToConstant: 50)
            ])
            
        button.addTarget(self, action: #selector(editImageBtn), for: .touchUpInside)
        } else if btnValue == true {
            button.isHidden = true
        }
           
           // Set constraints for the UIButton
          
    }
    @objc func editImageBtn(){
        print("btn clicked img")
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
            self.profilePic.image = selectedImage
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
    
    
    func clickedSubmit(){
        guard let fname = self.firstName.text else {return}
        guard let lname = self.lastName.text else {return}
        guard let email = self.emailId.text else {return}
        guard let phone = self.phoneNumber.text else {return}
        guard let dob = self.dateOfBirth.text else {return}
        let req = EditRequest(first_name: fname, last_name: lname, email: email, dob: dob, profile_pic: "",  phone_no: phone)
        self.editProfileVM.editRequest(logs: req)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let HomeVC = sb.instantiateViewController(withIdentifier: "HomeVC")
        self.navigationController?.pushViewController(HomeVC, animated: true)
    }
    
    
}
