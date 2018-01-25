//
//  ViewController.swift
//  AppStoreDuplicate
//
//  Created by MAC01 on 25/01/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class AppCategoryCollectionView: UICollectionViewController {

    private let identifier = "categoryCell"
    
    var model: AppCategoryViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.model = AppCategoryViewModel()
        
        collectionView?.backgroundColor = UIColor(white:0.95, alpha:1)
        collectionView?.register(CategoryCellView.self, forCellWithReuseIdentifier: identifier)
        collectionView?.alwaysBounceVertical = true
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
        
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier , for: indexPath) as! CategoryCellView
        
        let dataModel = self.model.appCategoryArray[indexPath.row]
        
        cell.appCategoryDataModel = dataModel
 
        return cell
    }

}

//Use delegate for make the code clean

extension AppCategoryCollectionView : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (self.collectionView?.frame.size.width)!,  height:200)
    }
}



