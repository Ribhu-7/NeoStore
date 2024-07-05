//
//  HomeViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 04/07/24.
//

import UIKit

class HomeViewController: UIViewController{
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var sliderImages = ["slider_img1", "slider_img2","slider_img3","slider_img4"]

    @IBOutlet weak var myPageControl: UIPageControl!
    var currentIndex = 0
    var timer: Timer?
    @IBOutlet weak var navBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        
        let nib = UINib(nibName: "MyCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "MyCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
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
    
    
}
