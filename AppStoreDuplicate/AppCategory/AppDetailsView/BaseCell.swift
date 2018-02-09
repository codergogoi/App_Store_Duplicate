//
//  BaseCell.swift
//  AppStoreDuplicate
//
//  Created by MAC01 on 09/02/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class BaseCell : UICollectionViewCell{
 
    
    var appIcon : UIImageView = {
        
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = 20
        
        return imgView
    }()
    
    
    
    let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.translatesAutoresizingMaskIntoConstraints = false
        collView.backgroundColor = UIColor.blue
        
        return collView
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setupSubViews(){
        
        
    }
    
}
