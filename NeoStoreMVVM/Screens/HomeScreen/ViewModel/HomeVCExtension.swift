//
//  HomeVCExtension.swift
//  NeoStoreMVVM
//
//  Created by Apple on 04/07/24.
//

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliderImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        
        cell.myImage.image = UIImage(named: sliderImages[indexPath.row])
        return cell
    }
}
