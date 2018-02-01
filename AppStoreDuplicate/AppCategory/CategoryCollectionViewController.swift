//
//  ViewController.swift
//  AppStoreDuplicate
//
//  Created by MAC01 on 25/01/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit


class CategoryCollectionViewController: UICollectionViewController {

    private let identifier = "categoryCell"
    private let headerIdentifire = "headerBanner"
    private let footerIdentifier = "footerBanner"
    
    var model: CategoryCollectionViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.model = CategoryCollectionViewModel()
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: identifier)
        collectionView?.register(HeaderBannerCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader , withReuseIdentifier: headerIdentifire)
        collectionView?.register(FooterBannerCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter , withReuseIdentifier: footerIdentifier)
        collectionView?.alwaysBounceVertical = true
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
 
        return CGSize(width:collectionView.frame.size.width, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: 140)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier , for: indexPath) as! CategoryCell
        cell.categoryCVC = self
        let dataModel = self.model.appCategoryArray[indexPath.row]
        cell.appCategoryDataModel = dataModel
        
        if let appModel = dataModel.appsModel{
            cell.dataModel = appModel
        }
 
 
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader{
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifire, for: indexPath) as! HeaderBannerCell
            header.bannerDataModel = model.bannerAppArray
            return header
        }else if kind == UICollectionElementKindSectionFooter{
            
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerIdentifier, for: indexPath) as! FooterBannerCell
            footer.bannerDataModel = model.bannerAppArray // :TODO - replace with footer actual data
            
            return footer
        }
        
        return UICollectionViewCell()

    }
    
    
    func loadAppDetailsView(){
        
        let layout = UICollectionViewFlowLayout()
        let detailsView = AppDetailsCollectionView(collectionViewLayout: layout)
        
        self.navigationController?.pushViewController(detailsView, animated: true)
    }
    
}

//Use delegate for make the code clean

extension CategoryCollectionViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (self.collectionView?.frame.size.width)!,  height:160)
    }
}



