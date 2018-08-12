//
//  Restaurant.swift
//  foodpin
//
//  Created by viplab on 2018/8/12.
//  Copyright © 2018年 viplab. All rights reserved.
//

import Foundation

class Restaurant {
    var name: String
    var type: String
    var location: String
    var image: String
    var isVisited: Bool
    
    init(name: String,type: String,location: String,image: String,isVisited: Bool){
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
    
    convenience init(){
        self.init(name: "", type: "", location: "", image: "", isVisited: false)
    }
}
