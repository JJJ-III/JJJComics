//
//  JJJtest.swift
//  JJJComics
//
//  Created by jinjiajian on 2017/7/25.
//  Copyright © 2017年 jjj. All rights reserved.
//

import UIKit

class JJJtest: NSObject {

    static var jjjtestBackgroudColor : UIColor = UIColor.black
    
    var jjjTestStr : String?
    
    
    func show() {
        print("类型属性：\(JJJtest.jjjtestBackgroudColor) \n 实例属性:\(self.jjjTestStr!) ")
    }
    
    subscript(index : Int , clome : Int) -> String{
        
        get{
            
            return "\(index * clome)"
        }
        
        set{
            
            print(newValue)
            jjjTestStr = "\(index * clome)"
        }
        
    }
    
    
}
