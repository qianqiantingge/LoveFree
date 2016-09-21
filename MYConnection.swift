//
//  MYConnection.swift
//  LoveFree
//
//  Created by qianfeng on 16/8/24.
//  Copyright © 2016年 kimCheng. All rights reserved.
//

import UIKit

class MYConnection: NSObject {
//    MARK:属性
    
//    记录网址
    var url:String
//    数据
    let downLoad = NSMutableData()
//    记录对象
    var target:AnyObject?
//    记录一个方法
    var action:Selector?
//    记录下载的状态
    var isFish = false
//    标记
    var tag:Int?
//     
    var connetion:NSURLConnection?
    
//    MARK:方法
    init(url1:String,targrt:AnyObject,action:Selector,tag:Int=0) {
            print(url1)
            self.url = url1
            self.target = targrt
            self.action = action
            self.tag = tag
    }
//
    func start() -> Void {
        let url1 = NSURL.init(string: url)
        let reque = NSURLRequest.init(URL: url1!)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        connetion = NSURLConnection.init(request: reque, delegate: self)
        
    }
    deinit{
//自动ARC
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
    }

}
extension MYConnection:NSURLConnectionDataDelegate{
 
    func stop() -> Void {
        connetion?.cancel()
    }
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        downLoad.length = 0
    }
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        downLoad.appendData(data)
    }
    func connectionDidFinishLoading(connection: NSURLConnection) {
        isFish = true
        target?.performSelector(action!, withObject: self)
    }
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        isFish = false
        target?.performSelector(action!, withObject: self)
    }

}