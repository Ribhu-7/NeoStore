//
//  ProductQuantityController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 16/07/24.
//

import UIKit

class ProductQuantityController: UIViewController {

    @IBOutlet weak var submitBtn: UIButton!
    
    @IBOutlet weak var quantityHead: UILabel!
    
    @IBOutlet weak var quantityImg: UIImageView!
    
    @IBOutlet weak var quantityField: UITextField!
    
    var prodImg: String!
    var prodLbl: String!
    var prodId: Int!
    var quantity: String!
    var cartViewModel = CartViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        quantityImg.setImage(with: prodImg)
        quantityHead.text = prodLbl
        print(prodId!)
        //quantityField.text
        
    }

    override func prepare(for segue: UIStoryboardSegue , sender: Any?){
        if segue.identifier == "cartSegue" {
            dismiss(animated: true)
        }
    }
    
    @IBAction func submitClick(_ sender: Any) {
        let req = CartRequest(product_id: prodId, quantity: Int(self.quantityField.text ?? "0") ?? 0)
//        print(Int(quantity))
                cartViewModel.addtoCart(cartreq: req)
                
        dismiss(animated: true)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
//           self.showCart()
//        }
    }
    
//    func showCart(){
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let cartVC = sb.instantiateViewController(withIdentifier: "cartVC") as! CartViewController
//        self.navigationController?.pushViewController(cartVC, animated: true)
//    }
}
