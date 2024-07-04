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
    @IBOutlet weak var navBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }

   @objc func menuTapped(){
        
    }

    @objc func playTapped(){
        
    }
}
