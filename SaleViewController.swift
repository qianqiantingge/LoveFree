//
//  SaleViewController.swift
//  LoveFree
//
//  Created by qianfeng on 16/8/24.
//  Copyright © 2016年 kimCheng. All rights reserved.
//

import UIKit

class SaleViewController: ListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.url = self.saleU
//        let urlstr = String.init(format: saleU, 1)
//        let mc = MYConnection.init(url1: urlstr, targrt: self, action: #selector(self.connection1(_:)))
//        mc.start()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAtIndexPath: indexPath) as! AppCell
         let model = dataArr[indexPath.row]
        cell.subLa.text = String.init(format:"现价：￥0.1f",Float(model.currentPrice!)!)
        return cell
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
