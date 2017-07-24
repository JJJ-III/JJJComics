//
//  ViewController.swift
//  JJJComics
//
//  Created by jinjiajian on 2017/7/24.
//  Copyright © 2017年 jjj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myFirstLabrl : UILabel = UILabel()
        myFirstLabrl.text = "hello world!";
        myFirstLabrl.font = UIFont.systemFont(ofSize: 40)
        self.view.addSubview(myFirstLabrl)
        myFirstLabrl.sizeToFit()
        myFirstLabrl.center = self.view.center
        
        
        myFirstLabrl.backgroundColor = UIColor.black
        myFirstLabrl.textColor = UIColor.white
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

