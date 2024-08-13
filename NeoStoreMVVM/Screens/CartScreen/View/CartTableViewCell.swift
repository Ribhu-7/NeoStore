//
//  CartTableViewCell.swift
//  NeoStoreMVVM
//
//  Created by Apple on 11/07/24.
//

import UIKit


class CartTableViewCell: UITableViewCell , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var dropdownTableView: UITableView!
    
    var options: [Int] = [1, 2, 3, 4]
    var isDropdownVisible = false
    
    @IBOutlet weak var cartImageView: UIImageView!
    
    @IBOutlet weak var cartHead: UILabel!
    
    @IBOutlet weak var cartDesc: UILabel!
    
    @IBOutlet weak var cartCount: UIButton!
    
    var cartViewDelegate: CartViewDelegate?
    
    @IBOutlet weak var cartPrice: UILabel!
    
    var cartData: ListCartData? {
        didSet{
            cartConfiguration()
        }
    }
    
    var prodId: Int!
    var prodCost: Int!
    
    let transparentView = UIView()
    let tableView = UITableView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupViews()
        
    }
    
    
    func setupViews(){
        dropdownTableView.delegate = self
        dropdownTableView.dataSource = self
        dropdownTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        dropdownTableView.isHidden = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func cartConfiguration(){
        let cost = UserDefaults.standard.integer( forKey: "ProdCost \(String(describing: cartData?.product_id))")
        let quant = UserDefaults.standard.integer(forKey: "ProdQuant \(String(describing: cartData?.product_id))")
        //let totalcost = cost*quant
        prodId = cartData?.product.id
        prodCost = cartData?.product.cost
        cartHead.text = cartData?.product.name
        cartDesc.text = cartData?.product.product_category
        //cartCount.setTitle(String(quant), for: .normal)
        //cartPrice.text = "Rs. \(totalcost)"
        cartImageView.setImage(with: cartData?.product.product_images ?? "")
    }
    @IBAction func dropdownClick(_ sender: Any) {
        if self.isDropdownVisible == false {
            self.isDropdownVisible = true
            self.dropdownTableView.heightAnchor.constraint(equalToConstant: self.isDropdownVisible ? CGFloat(self.options.count * 44) : 0).isActive = true
        } else if self.isDropdownVisible == true{
            self.isDropdownVisible = false
        }
        self.dropdownTableView.isHidden = !self.isDropdownVisible
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
            self.dropdownTableView.layer.borderWidth = 1.0
            self.dropdownTableView.layer.borderColor = UIColor.lightGray.cgColor
            
        }
        self.dropdownTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dropdownTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(options[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        cartCount.setTitle(String(options[indexPath.row]), for: .normal)
        let req = EditCartRequest(product_id: self.prodId, quantity: options[indexPath.row])
        UserDefaults.standard.set(options[indexPath.row], forKey: "ProdQuant \(String(describing: self.prodId))" )
        
        cartViewDelegate?.cartAdded(request: req)
        dropdownTableView.isHidden = true
        isDropdownVisible = false
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
