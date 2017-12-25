//
//  JJJWebViewViewController.swift
//  JJJComics
//
//  Created by jinjiajian on 2017/7/31.
//  Copyright © 2017年 jjj. All rights reserved.
//

import UIKit

class JJJWebViewViewController: UIViewController {
    
    lazy var webView : UIWebView = UIWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "webView"
        self.view.backgroundColor = UIColor.blue
        
        self.view.addSubview(webView)
        webView.frame = self.view.frame
        let urlStr : String = "http://hmapi.7bao.com/a1b2c3-index1.html"
        let url : URL = URL.init(string: urlStr)!;
        webView.loadRequest(URLRequest.init(url: url))
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
