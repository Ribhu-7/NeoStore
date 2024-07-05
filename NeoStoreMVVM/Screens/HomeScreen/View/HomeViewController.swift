//
//  HomeViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 04/07/24.
//

import UIKit

class HomeViewController: UIViewController{
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var sideUIView: UIView!
    @IBOutlet var parentView: UIView!
    
    
    //    @IBOutlet weak var sideView: UIView!
    var sliderImages = ["slider_img1", "slider_img2","slider_img3","slider_img4"]

    @IBOutlet weak var myPageControl: UIPageControl!
    var currentIndex = 0
    var timer: Timer?
    @IBOutlet weak var navBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
//        parentView.bringSubviewToFront(sideView)
        let nib = UINib(nibName: "MyCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "MyCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        sideUIView.isHidden = true
        
//        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(sliderPage), userInfo: nil, repeats: true)
        myPageControl.numberOfPages = sliderImages.count
        myPageControl.currentPage = 0
    }

//    @objc func sliderPage(){
//
//        if currentIndex < sliderImages.count - 1 {
//            currentIndex = currentIndex + 1
//        } else {
//            currentIndex = 0
//        }
//    }
    
   @objc func menuTapped(){
        
    }

    @objc func playTapped(){
        
    }
    
    @IBAction func menuBtnClick(_ sender: UIButton) {
        sideUIView.isHidden = false
    }
    
//    @IBAction func backButton(_ sender: UIButton) {
//        sideUIView.isHidden = true
//        print("back pressed")
//    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        sideUIView.isHidden = true
    }
    
}
