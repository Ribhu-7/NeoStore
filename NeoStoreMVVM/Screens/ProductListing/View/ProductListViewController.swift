//
//  ProductListViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 09/07/24.
//

import UIKit


class ProductListViewController: UIViewController{

    @IBOutlet weak var prodHeading: UILabel!
    @IBOutlet weak var buyNowOutlet: UIButton!
    @IBOutlet weak var rateUsOutlet: UIButton!
    @IBOutlet weak var hideImage: UIView!
    @IBOutlet weak var prodStock: UILabel!
    @IBOutlet weak var prodCategory: UILabel!
    
    @IBOutlet weak var prodDesc: UILabel!
    @IBOutlet weak var prodRatingView: UIView!
    @IBOutlet weak var prodPrice: UILabel!
    @IBOutlet weak var prodImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var centerImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var loadingView: UIView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var prodHead : String!
    var prodCatg : String!
    var prodDes : String!
    var prodRate : Int!
    var prodPrc: String!
    var prodImg: String!
    var prodID: Int!
    var prodQuantity: Int!
    var prodViewCount: Int!
    
    var cartViewModel = CartViewModel()
    var proddetailViewModel = ProductDetailViewModel()
    var cartViewController : CartViewController?
    var prodRatingVM: ProductRatingVM?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.alpha = 1
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "homekit"), style: .plain, target: self, action: #selector(searchClicked))
        // Do any additional setup after loading the view.
        //prodHeading.text = prodHead
        prodCategory.text = prodCatg
        buyNowOutlet.changeView()
        rateUsOutlet.changeView()
        //prodDesc.text = prodDes
        //prodRatingView.setStarRating(rating: prodRate)
        //prodImageView.setImage(with: prodImg)
        //leftImageView.setImage(with: prodImg)
        leftImageView.setBorder(colour: .red)
        centerImageView.setBorder(colour: .lightGray)
        rightImageView.setBorder(colour: .green)
        //centerImageView.setImage(with: prodImg)
        //rightImageView.setImage(with: prodImg)
        //prodPrice.text = prodPrc
        
        self.activityIndicator.transform = CGAffineTransform(scaleX: 3, y: 3)
        self.activityIndicator.startAnimating()
        if prodViewCount == 0 {
            prodStock.isHidden = false
            hideImage.isHidden = false
        } else {
            prodStock.isHidden = true
            hideImage.isHidden = true
        }
        let req = ProductListRequest(product_id: String(self.prodID ?? 0))
        initViewModel(req: req)
        observeEvent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    override func viewWillDisappear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
    }

    func initViewModel(req: ProductListRequest){
        proddetailViewModel.fetchProducts(dataTab: req)
    }
    func observeEvent(){
        proddetailViewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading:
                print("Loading...")
            case .stopLoading:
                print("Loading stopped...")
            case .dataLoaded:
                print("Data Loaded...")
                print(self.proddetailViewModel.products ?? {})
                DispatchQueue.main.async {
                    self.prodHeading.text = self.proddetailViewModel.products?.name
                    self.prodDesc.text = self.proddetailViewModel.products?.producer
                    self.prodPrice.text = "Rs \(self.proddetailViewModel.products?.cost ?? 0)"
                    let prodRt = UserDefaults.standard.integer(forKey: "ProdRating: \(self.prodID ?? 0)")
                    self.prodRatingView.setStarRating(rating: prodRt)
                    self.prodRatingView.setStarRating(rating: self.proddetailViewModel.products?.rating ?? 0)
                    self.prodImageView.setImage(with: self.proddetailViewModel.products?.product_images?.first?.image ?? "")
                    self.centerImageView.setImage(with: self.proddetailViewModel.products?.product_images?.first?.image ?? "")
                    self.leftImageView.setImage(with: self.proddetailViewModel.products?.product_images?.first?.image ?? "")
                    self.rightImageView.setImage(with: self.proddetailViewModel.products?.product_images?.first?.image ?? "")
                    self.loadingView.isHidden = true
                }
            case .error(let error):
                print(error ?? "")
            }
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.navigationItem.backButtonTitle = ""
    }
    
    @IBAction func buyNow(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let prodQuantity = sb.instantiateViewController(withIdentifier: "prodQuantity") as! ProductQuantityController
        prodQuantity.prodImg = prodImg
        prodQuantity.prodLbl = self.proddetailViewModel.products?.name
        prodQuantity.prodId = self.proddetailViewModel.products?.id
        prodQuantity.productQuantityDelegate = self
        prodQuantity.modalPresentationStyle = .overFullScreen
        prodQuantity.modalTransitionStyle = .crossDissolve
        self.present(prodQuantity, animated: true)
    }
    
    @IBAction func rateNow(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let prodRating = sb.instantiateViewController(withIdentifier: "productRating") as! ProductRatingController
        prodRating.prodImg = prodImg
        prodRating.prodLbl = prodHead
        prodRating.prodRate = prodRate
        prodRating.prodID = prodID
        prodRating.modalPresentationStyle = .overFullScreen
        prodRating.modalTransitionStyle = .crossDissolve
        self.present(prodRating, animated: true)
    }
    
    @objc func searchClicked(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let HomeVC = sb.instantiateViewController(withIdentifier: "HomeVC")
        self.navigationController?.pushViewController(HomeVC, animated: true)
    }
    
    @IBAction func shareBtn(_ sender: Any) {
        print("Share Item")
        
    }
    
}

extension ProductListViewController : ProductQuantityDelegate {
    func quantityAdded() {
        self.showCart()
    }
}

extension ProductListViewController : ProductRatingDelegate {
    func ratingAdded(req: RatingRequest) {
        self.prodRatingVM?.rateRequest(logs: req)
    }
}
