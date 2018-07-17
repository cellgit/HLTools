//
//  HLWebUrl.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/7/17.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLWebUrl: NSObject {

}


///使用示例：let str = self.webUrl.urlEncoded()
///注: url中含有汉字时可以使用
extension String {
    //将原始的url编码为合法的url
    func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
    //将编码后的url转换回原始的url
    func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
}

//写法二
//extension String {
//将原始的url编码为合法的url

//    func webUrl() {
//        let urlStr = CFURLCreateStringByAddingPercentEscapes(nil, self.webUrl as CFString, "!*'();:@&=+$,/?%#[]" as CFString, nil, CFStringBuiltInEncodings.UTF8.rawValue)
//        PrintLog(message: "-----------======\(String(describing: urlStr))")
//    }
//}
