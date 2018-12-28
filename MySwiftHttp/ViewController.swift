//
//  ViewController.swift
//  MySwiftHttp
//
//  Created by 叶金永 on 2018/8/24.
//  Copyright © 2018年 Keyon. All rights reserved.
//

import UIKit
import PromiseKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		var param = [String:Any]()
		param["platform"] = "iOS"
		param["position"] = "首页"
		param["pageSize"] = "5"
		let url = "https://dev.niumowang-inc.com:9445/" + "api/banner/homebanner"
		
		firstly{
			HttpClient.shareClient.httpRequest(with: url, requestType: .POST, paramOfType: .FORM, parameter: param)
		}.done{ [weak self] data in
			debugPrint(JSON(data.data))
		}.catch{ error in
			debugPrint(error.localizedDescription)
		}
		
		HttpClient.shareClient.httpRequest(with: url, requestType: .POST, paramOfType: .FORM, parameter: param).then { (tag) -> Promise<Int> in
			debugPrint(JSON(tag.data))
			return .value(1)
		}.done{ value in
			debugPrint(value)
		}.catch { (error) in
			debugPrint(error.localizedDescription)
		}
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

