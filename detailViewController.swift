//
//  detailViewController.swift
//  LoveFree
//
//  Created by qianfeng on 16/8/25.
//  Copyright © 2016年 kimCheng. All rights reserved.
//

import UIKit

class detailViewController: BaseViewController {
    var model:AppModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel.init(frame: self.view.bounds)
        label.numberOfLines = 0
        label.font = UIFont.systemFontOfSize(15)
//        if model == nil {
//            return
//        
//        }
        self.view.addSubview(label)
         label.text = String.init(format: "%@\n%@\n%@\n", (model?.applicationId!)!,model!.categoryName!,model!.description)

    }


    

}
