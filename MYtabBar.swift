//
//  MYtabBar.swift
//  LoveFree
//
//  Created by qianfeng on 16/8/24.
//  Copyright © 2016年 kimCheng. All rights reserved.
//

import UIKit

class MYtabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(self)
//         工程名
        let proName = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        print(proName)
        let path = NSBundle.mainBundle().pathForResource("TabBar.plist", ofType: nil)
//         直接把plist 督导数组里
        let plist = NSArray.init(contentsOfFile: path!) as! [[String:String]]
        for dic in plist {
//            dic["name"]
        let name = proName+"."+dic["name"]!
            print(name)
//     将字符串转成类    self Type dynamicType
        let vcClass = NSClassFromString(name) as! UIViewController.Type
//             构造页面对象
        let vc = vcClass.init()
        let nc = UINavigationController.init(rootViewController: vc)
            vc.navigationItem.title = dic["title"]
            nc.tabBarItem = UITabBarItem.init(title: dic["title"], image:UIImage.init(named: dic["icon"]!), tag: 0)
            self.addChildViewController(nc)
              nc.tabBarController!.tabBar.tintColor = UIColor.redColor()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
