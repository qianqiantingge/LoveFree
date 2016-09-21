//
//  ListViewController.swift
//  LoveFree
//
//  Created by qianfeng on 16/8/24.
//  Copyright © 2016年 kimCheng. All rights reserved.
//

import UIKit
//
class ListViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    let limitU = "http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=%d"
    let freeU = "http://iappfree.candou.com:8080/free/applications/free?currency=rmb&page=%d"
    let saleU = "http://iappfree.candou.com:8080/free/applications/sales?currency=rmb&page=%d"
    let table = UITableView()
    var dataArr = [AppModel]()
//    记录应该加载的网址
    var url:String?
    var page = 2
    override func viewDidLoad() {
        super.viewDidLoad()
        table.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
        table.rowHeight = 200
        table.delegate = self
        table.dataSource = self
        table.registerNib(UINib.init(nibName: "AppCell", bundle: nil), forCellReuseIdentifier: "qqq")
        self.view.addSubview(table)
//        页面弱应用
           weak var weakself = self

        table.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
//           闭包会捕获内部的实例 变成循环引用 防止循环引用所以设置弱引用 闭包内部打破 也有可能在其他地方 打破
       weak var weakself = self
         let url = String.init(format: weakself!.url!, 1)
            let mc = MYConnection.init(url1: url, targrt: self, action: #selector(weakself!.connection1(_:)),tag: 1)
         mc.start()
         })
        
        table.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            //  闭包会捕获内部的实例 变成循环引用 防止循环引用所以设置弱引用 闭包内部打破 也有可能在其他地方 打破
            weak var weakself = self
            let url = String.init(format: weakself!.url!, 1)
            let mc = MYConnection.init(url1: url, targrt: self, action: #selector(weakself!.connection1(_:)),tag: 1)
            mc.start()
        })
    


//        直接刷新的效果
        table.mj_header.beginRefreshing()
        if let data = self.readLocal() {
            self.parseData(data)
        
        
        
        }
 
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("qqq",forIndexPath: indexPath) as! AppCell
        cell.constrrem(dataArr[indexPath.row])
        
        return cell
        
    }
    func parseData(data:NSData){
       let dic1 = try! NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as! NSDictionary
        let appArr = dic1["applications"] as! [[String:AnyObject]]
        for obj in appArr {
            dataArr.append(AppModel.modelWith(obj))
        
        }
        

    }

    func connection1(mc:MYConnection) -> Void {
        
            if mc.isFish == true {
                if mc.tag == 1 {
                    dataArr.removeAll()
                    page = 2
                    self.writeToLocal(mc.downLoad)
                }else {
                    page+=1
                }
                
                
         self.parseData(mc.downLoad)
                table.reloadData()
            }else {
                print("\(self)网络失败")
        
        
        }
        
        table.mj_header.endRefreshing()
        table.mj_footer.endRefreshing()

    }


}
extension ListViewController{
//   self type dy
    func writeToLocal(data:NSData){
//        类名转化为字符串
        let name = NSStringFromClass(self.dynamicType)
        let path = String.init(format: "%@/Documents/%@.txt", NSHomeDirectory(),name)
        data.writeToFile(path, atomically: true)
    
    }
    func readLocal()->NSData?{
        let name = NSStringFromClass(self.dynamicType)
        let path = String.init(format: "%@/Documents/%@.txt", NSHomeDirectory(),name)
        
        return  NSData.init(contentsOfFile: path)!
    
    }


}