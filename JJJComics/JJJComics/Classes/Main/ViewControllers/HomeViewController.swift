//
//  HomeViewController.swift
//  JJJComics
//
//  Created by jinjiajian on 2017/12/25.
//  Copyright © 2017年 jjj. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - 私有方法
    
    func configUI() {
        
        view.backgroundColor = UIColor.white
        self.title = "这是首页"
        
        
    }
    

}
