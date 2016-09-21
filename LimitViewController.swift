//
//  LimitViewController.swift
//  LoveFree
//
//  Created by qianfeng on 16/8/24.
//  Copyright © 2016年 kimCheng. All rights reserved.
//

import UIKit

class LimitViewController: ListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.url = self.limitU
//        let urlstr = String.init(format: limitU, 1)
//        let mc = MYConnection.init(url1: urlstr, targrt: self, action: #selector(self.connection1(_:)))
//        mc.start()
//  
        NSTimer.scheduledTimerWithTimeInterval(60, target: self, selector: #selector(self.resh), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    func resh() -> Void {
        table.reloadData()
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAtIndexPath: indexPath) as! AppCell
        let model = dataArr[indexPath.row]
        cell.subLa.text = self.stringFromeData(model.expireDatetime!)
        return cell
    }
    func stringFromeData(dateStr:String) -> String {
//    获取当前时间 NSData    时间戳 时间转化为子字符串
        let dataFor = NSDateFormatter()
//         字符串的格式
        dataFor.dateFormat = "yyyy-MM-dd HH:mm:ss.0"
        
        
//        转化输入的时间
        let data = dataFor.dateFromString(dateStr)!
//         计算时间差
        let time = Int(data.timeIntervalSinceNow)
        if time < 1{
            return "0:0:0"
        
        }
        
        return String.init(format: "剩余：%02d:%02d:%02d", time/3600,time%3600/60,time%60)
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
