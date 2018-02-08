//
//  AppDetailsCollectionView.swift
//  AppStoreDuplicate
//
//  Created by MAC01 on 29/01/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

private let cellIdentifier = "Cell"

class AppDetailsCollectionView: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}


class DetailsCell : UICollectionViewCell{
    
    var appIcon : UIImageView = {
       
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = 20
        
        return imgView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
    func setupSubViews(){
        
        backgroundColor = UIColor.gray
        
    }
    
}

class DetailsHeaderCell : DetailsCell{
    
    override func setupSubViews() {
         super.setupSubViews()
        
        
    }
    
}




