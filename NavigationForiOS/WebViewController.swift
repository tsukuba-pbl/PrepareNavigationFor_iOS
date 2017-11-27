//
//  WebViewController.swift
//  PrepareNavigationForiOS
//
//  Created by みなじゅん on 2017/11/27.
//  Copyright © 2017年 UmeSystems. All rights reserved.
//

import Foundation
import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate設定
        webView.delegate = self as? UIWebViewDelegate
        
        // インスタンスをビューに追加する
        self.view.addSubview(webView)
        
        // URLを指定
        let url: URL = URL(string: Const().URL_HOME)!
        let request: URLRequest = URLRequest(url: url)
        
        // リクエストを投げる
        webView.loadRequest(request)
        
    }
    
    
    // ロード時にインジケータをまわす
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        print("indicator on")
    }
    
    // ロード完了でインジケータ非表示
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        print("indicator off")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

