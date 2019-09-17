//
//  ViewController.swift
//  JJJComics
//
//  Created by jinjiajian on 2017/7/24.
//  Copyright © 2017年 jjj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var myFirstLabel : UILabel = UILabel()
    lazy var myButton : UIButton = UIButton()
    var mytest : String{
        
        get{
            return self.myFirstLabel.text!
        }
        
        set{
            
            self.myFirstLabel.text = newValue
            
        }
        
        

        
    }
    
    var test_2 : String? {
    
        willSet{
    
            print("我要被赋值了,值将是\(newValue!)" )
        }
        
        didSet{
            print("我已经被赋值了，值是\(test_2!)是我老婆")
        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showLabel(contentStr: "hello world")
        
        self.view.addSubview(self.myButton)
        myButton.frame.origin.x = 0
        myButton.frame.origin.y = 0
        myButton.frame.size.width = 100
        myButton.frame.size.height = 100
        myButton.backgroundColor = UIColor.green
        myButton.addTarget(self, action: #selector(ViewController.click), for: UIControl.Event.touchUpInside)
        
        
        print(self.mytest)
        
        self.test_2 = "新垣结衣"
        
        let one : JJJtest = JJJtest()
        
        let two : JJJtest = JJJtest()
        
        one.jjjTestStr = "jjjtest   1111号"
        two.jjjTestStr = "jjjtest   2222号"

        one.show()
        two.show()
        
        one.jjjTestStr = "在来一次"
        one.show()
        
        JJJtest.jjjtestBackgroudColor = UIColor.red
        one.show()
        two.show()
        
        
        
        let newStr : String = one[1,2]
        print(newStr)
        
        one[2,4] = "哈哈哈哈"
        
        print(one.jjjTestStr!)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showLabel(contentStr : String) {
        
        self.myFirstLabel.font = UIFont.systemFont(ofSize: 40);
        self.view.addSubview(self.myFirstLabel)
        self.myFirstLabel.text = contentStr
        self.myFirstLabel.sizeToFit()
        self.myFirstLabel.center = self.view.center
        
        
        self.myFirstLabel.backgroundColor = UIColor.black
        self.myFirstLabel.textColor = UIColor.white
        
    }
    
    @objc func click() {
        
        self.mytest = "新垣结衣"
        
        let webViewVC : JJJWebViewViewController = JJJWebViewViewController()
        let nvc : UINavigationController = UINavigationController(rootViewController:webViewVC)
        self.present(nvc, animated: true, completion: nil)
        
//        self.navigationController?.pushViewController(webViewVC, animated: true)
        
    }


}

