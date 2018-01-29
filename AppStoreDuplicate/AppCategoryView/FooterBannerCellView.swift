//
//  FooterBannerCellView.swift
//  AppStoreDuplicate
//
//  Created by MAC01 on 29/01/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class FooterBannerCellView: CategoryCellView {
    
    private let footerIdentifier = "footerView"
    
    override func setupView() {
       
        self.addSubview(appCollectionView)
        appCollectionView.translatesAutoresizingMaskIntoConstraints = false
        appCollectionView.backgroundColor = UIColor.lightGray
        appCollectionView.delegate = self
        appCollectionView.dataSource = self
        appCollectionView.showsHorizontalScrollIndicator = false
        appCollectionView.alwaysBounceHorizontal = true
        
        appCollectionView.register(FooterCellView.self, forCellWithReuseIdentifier: footerIdentifier)
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appCollectionView]))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appCollectionView]))
        
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let footerBannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: footerIdentifier, for: indexPath) as! FooterCellView
        
        return footerBannerCell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: 120)
    }
    

}


class FooterCellView: AppCellView {
    
    override func setupView() {
        self.addSubview(appIconImg)
       // appIconImg.backgroundColor = UIColor.cyan
        appIconImg.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appIconImg]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appIconImg]))
        
    }
    
}
