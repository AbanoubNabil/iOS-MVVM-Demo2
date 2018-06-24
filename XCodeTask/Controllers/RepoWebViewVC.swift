//
//  RepoWebViewCVViewController.swift
//  XCodeTask
//
//  Created by Sayed Abdo on 6/7/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import UIKit
import WebKit

class RepoWebViewVC: UIViewController {

    var webView: WKWebView!
    var viewModelObj = ReposetriesViewModel.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        let repo = view.viewWithTag(1) as! WKWebView
        let myURL = URL(string: (viewModelObj.selectedRepo?.repo_url)! )
        let myRequest = URLRequest(url: myURL!)
        repo.load(myRequest)
        
    }

}
