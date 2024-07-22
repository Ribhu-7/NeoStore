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
    
    
    @IBOutlet weak var cartPrice: UILabel!
    
    var cartImg: String!
    
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
    
    @IBAction func dropdownClick(_ sender: Any) {
        if isDropdownVisible == false {
            isDropdownVisible = true
        } else if isDropdownVisible == true{
            isDropdownVisible = false
        }
        dropdownTableView.isHidden = !isDropdownVisible
        UIView.animate(withDuration: 0.3) {
        self.dropdownTableView.heightAnchor.constraint(equalToConstant: self.isDropdownVisible ? CGFloat(self.options.count * 44) : 0).isActive = true
                  self.layoutIfNeeded()
              }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = String(options[indexPath.row])
            return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            cartCount.setTitle(String(options[indexPath.row]), for: .normal)
            dropdownTableView.isHidden = true
            isDropdownVisible = false
            dropdownTableView.heightAnchor.constraint(equalToConstant: 0).isActive = true
        }
    
}
