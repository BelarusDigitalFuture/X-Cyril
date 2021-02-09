//
//  ConnectToBankWebViewController.swift
//  XmartRegistration
//
//  Created by Mac on 8.02.21.
//  Copyright © 2021 Xmart. All rights reserved.
//

import UIKit
import WebKit
import XmartExpansion

class ConnectToBankWebViewController: UIViewController, WKNavigationDelegate{

    @IBOutlet weak var webView: WKWebView!
    
    var connectLink:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        webView.load(URLRequest(url: URL(string: connectLink)!))
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if(navigationAction.request.url?.host == "xaccount.app"){
            let fullName = navigationAction.request.url!.absoluteString.components(separatedBy: "code=")
            print(fullName[1])
        }
        decisionHandler(.allow)
    }
}
