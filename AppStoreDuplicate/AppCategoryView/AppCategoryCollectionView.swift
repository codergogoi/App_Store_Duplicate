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
    private let headerIdentifire = "headerBanner"
    private let footerIdentifier = "footerBanner"
    
    var model: AppCategoryViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.model = AppCategoryViewModel()
        
        collectionView?.backgroundColor = UIColor(white:0.95, alpha:1)
        collectionView?.register(CategoryCellView.self, forCellWithReuseIdentifier: identifier)
        collectionView?.register(HeaderBannerCellView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader , withReuseIdentifier: headerIdentifire)
        collectionView?.register(FooterBannerCellView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter , withReuseIdentifier: footerIdentifier)
        collectionView?.alwaysBounceVertical = true
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
 
        return CGSize(width:collectionView.frame.size.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: 120)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier , for: indexPath) as! CategoryCellView
        cell.cellDelegate = self as? CategoryDelegate
        let dataModel = self.model.appCategoryArray[indexPath.row]
        cell.appCategoryDataModel = dataModel
 
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader{
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifire, for: indexPath) as! HeaderBannerCellView
            
            return header
        }else if kind == UICollectionElementKindSectionFooter{
            
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerIdentifier, for: indexPath) as! FooterBannerCellView
            
            return footer
        }
        
        return UICollectionViewCell()
        
    }
    
     
}

//Use delegate for make the code clean

extension AppCategoryCollectionView : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (self.collectionView?.frame.size.width)!,  height:200)
    }
}

extension AppDetailsCollectionView : CategoryDelegate{
    
    func loadControllerWithData(title: String?) {
        
        DispatchQueue.main.async {
            
            let layout = UICollectionViewFlowLayout()
            
            let detailsView = AppDetailsCollectionView(collectionViewLayout: layout)
            
            if let categoryTitle = title{
                detailsView.navigationItem.title = categoryTitle
            }
         
            self.navigationController?.pushViewController(detailsView, animated: true)
            
        }
       
        
    }
}



