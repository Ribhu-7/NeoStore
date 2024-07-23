//
//  ProductQuantityController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 16/07/24.
//

import UIKit

protocol ProductQuantityDelegate {
    func quantityAdded()
}

class ProductQuantityController: UIViewController {
    let sb = UIStoryboard(name: "Main", bundle: nil)
   
    

    @IBOutlet weak var submitBtn: UIButton!
    
    @IBOutlet weak var quantityHead: UILabel!
    
    @IBOutlet weak var quantityImg: UIImageView!
    
    @IBOutlet weak var quantityField: UITextField!
    var productQuantityDelegate: ProductQuantityDelegate?
    
    var cartViewController: CartViewController?
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
        
        //self.modalPresentationStyle = .overCurrentContext
        //quantityField.text
        
    }

//    override func prepare(for segue: UIStoryboardSegue , sender: Any?){
//        if segue.identifier == "cartSegue" {
//            if let nextDestination = segue.destination as? CartViewController {
//                self.cartViewController = nextDestination
//                //self.cartViewController = self
//                self.cartViewController = nextDestination
//                self.cartViewController?.delegate = self
//            }
//            //dismiss(animated: true)
//
//
//            }
//    }
    
    @objc func searchClicked(){
        
    }
    
    @IBAction func submitClick(_ sender: Any) {
        let quantTotal = Int(self.quantityField.text ?? "0") ?? 0
        let req = CartRequest(product_id: prodId, quantity: quantTotal)
        let prodListVC = sb.instantiateViewController(withIdentifier: "ProductListViewController") as! ProductListViewController
        prodListVC.prodQuantity = quantTotal
        cartViewModel.addtoCart(cartreq: req)
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let cartVC = sb.instantiateViewController(withIdentifier: "cartVC")
//        self.navigationController?.pushViewController(cartVC, animated: true)
       
        dismiss(animated: true)
        productQuantityDelegate?.quantityAdded()
        
        //dismiss(animated: true)
//        print(Int(quantity))
                
        //performSegue(withIdentifier: "cartSegue", sender: self)
        //dismiss(animated: true)
        
        //dismiss(animated: true)
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
