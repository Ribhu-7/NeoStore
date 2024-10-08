//
//  HomeViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 04/07/24.
//

import UIKit

class HomeViewController: UIViewController, SideViewControllerDelegate {
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var rightsideView: UIView!
    @IBOutlet weak var tableProdView: UIView!
    @IBOutlet weak var sofaProdView: UIView!
    @IBOutlet weak var chairProdView: UIView!
    @IBOutlet weak var cupboardView: UIView!
    @IBOutlet weak var sideUIView: UIView!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var myPageControl: UIPageControl!
    
    @IBOutlet weak var leadingConstraintSideView: NSLayoutConstraint!
    
    let sb = UIStoryboard(name: "Main", bundle: nil)
    
    var sliderImages = ["slider_img1", "slider_img2","slider_img3","slider_img4"]
    
    var sideViewController: SideViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "sideMenuSegue"){
            if let controller = segue.destination as? SideViewController {
                self.sideViewController = controller
                self.sideViewController?.delegate = self
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu_icon"), style: .plain, target: self, action: #selector(showMenu))
        let nib = UINib(nibName: "MyCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "MyCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        sideUIView.alpha = 0
        myPageControl.numberOfPages = sliderImages.count
        myPageControl.currentPage = 0
        self.rightsideView.isHidden = true
    
    }
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
        self.sideUIView.alpha = 0
        self.rightsideView.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
        self.navigationItem.backButtonTitle = ""
    }
        
    
    
    func hideSideMenu() {
        UIView.animate(withDuration: 0.2 , delay: 0.2 , options: .transitionFlipFromRight) {
            
            self.sideUIView.alpha = 0
            self.leadingConstraintSideView.constant = -280
            self.view.layoutIfNeeded()
            self.rightsideView.isHidden = true
        }
    }
    
    @objc func showMenu() {
        if sideUIView.alpha == 0 {
            UIView.animate(withDuration: 0.4, delay: 0.2 , options: .transitionFlipFromLeft) {
                self.rightsideView.isHidden = false
                self.sideUIView.alpha = 1
                self.leadingConstraintSideView.constant = 0
                self.view.layoutIfNeeded()
                self.sideUIView.layer.zPosition = 1
                DispatchQueue.main.async {
                    self.sideViewController?.sideTableView.reloadData()
                }
            }
        } else {
            self.hideSideMenu()
        }
        
    }
}
