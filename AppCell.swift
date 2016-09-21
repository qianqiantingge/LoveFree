//
//  AppCell.swift
//  LoveFree
//
//  Created by qianfeng on 16/8/24.
//  Copyright © 2016年 kimCheng. All rights reserved.
//

import UIKit

class AppCell: UITableViewCell {

    @IBOutlet weak var starim: UIImageView!
    @IBOutlet weak var imvStr: UIImageView!
    @IBOutlet weak var bottemL: UILabel!
    @IBOutlet weak var gameL: UILabel!
    @IBOutlet weak var priceL: UILabel!
    @IBOutlet weak var blackL: UILabel!
    @IBOutlet weak var grLa: UIImageView!
    @IBOutlet weak var iconV: UIImageView!
    @IBOutlet weak var titlLa: UILabel!
    @IBOutlet weak var subLa: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
      starim.backgroundColor = UIColor.yellowColor()
        starim.contentMode = .Left
        starim.clipsToBounds = true
        
        
    }
    func constrrem(model:AppModel) -> Void {
        iconV.sd_setImageWithURL(NSURL.init(string: model.iconUrl!))
        titlLa.text = model.name
        let pricrstr = model.lastPrice! as NSString
        priceL.text = String.init(format: "$%0.1f",pricrstr.floatValue)
        bottemL.text = String.init(format: "收藏：%@次 分享：%@次 下载：%@次", model.favorites!,model.shares!,model.downloads!)
        gameL.text = model.categoryName
        subLa.text = model.expireDatetime
        let sta = CGFloat(Float( model.starCurrent!)!)
        starim.frame.size.width = 107 / 5 * sta
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
