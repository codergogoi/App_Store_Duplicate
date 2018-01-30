//
//  AppCategoryViewModel.swift
//  AppStoreDuplicate
//
//  Created by MAC01 on 25/01/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class CategoryCollectionViewModel: NSObject {
    
    var appCategoryArray : [AppcategoryStruct] = []
    
    override init() {
        
        //TODO : - replace with API data
        appCategoryArray.append(AppcategoryStruct(categoryName: "Featured App"))
        appCategoryArray.append(AppcategoryStruct(categoryName: "Top 10 Apps"))
        appCategoryArray.append(AppcategoryStruct(categoryName: "Featured games"))
        
    }

}


struct AppcategoryStruct{
    
    var categoryName: String?
    
}

