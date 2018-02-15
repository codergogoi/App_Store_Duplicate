//
//  AppDetailsCollectionView.swift
//  AppStoreDuplicate
//
//  Created by MAC01 on 29/01/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

private let cellIdentifier = "appDetailsCell"
private let headerIdentifier = "appHeaderCell"
private let descIdentifier = "appDesc"
private let infoIdentifier = "infoDesc"

class AppDetailsCollectionView: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView?.register(AppDetailsCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView?.register(DescriptionCell.self, forCellWithReuseIdentifier: descIdentifier)
        collectionView?.register(InformationCell.self, forCellWithReuseIdentifier: infoIdentifier)
        collectionView?.register(AppDetailsHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader , withReuseIdentifier: headerIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.row == 0{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! AppDetailsCell
            return cell
            
        }else if indexPath.row == 1{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descIdentifier, for: indexPath) as! DescriptionCell
            return cell
            
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: infoIdentifier, for: indexPath) as! InformationCell
            return cell
            
        }
 
     }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader{
            
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath) as? AppDetailsHeaderCell{
                
                return header
            }
            
        }
        
        return UICollectionViewCell()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}

extension AppDetailsCollectionView : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width, height: 200)
    }
    
}



class DescriptionCell: BaseCell {
    
    let descriptionText: UITextView = {
        
        let desText = UITextView()
        desText.translatesAutoresizingMaskIntoConstraints = false
        desText.textColor = UIColor.darkGray
        desText.isEditable = false
        desText.showsVerticalScrollIndicator = false
        desText.showsHorizontalScrollIndicator = false
        desText.font = UIFont.systemFont(ofSize: 13)
        desText.text = "App descriptions and features details."
        return desText
    }()
    
    override func setupSubViews() {
        super.setupSubViews()
        addSubview(descriptionText)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": descriptionText]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": descriptionText]))
        
    }
}



 





