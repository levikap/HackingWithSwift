//
//  DetailViewController.swift
//  whitehousePetitions
//
//  Created by Levi Kaplan on 8/26/19.
//  Copyright © 2019 Levi Kaplan. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
        <head>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
        body { font-size: 120%; }
        h1 { font-size: 120%; }
        </style>
        </head>
        <h1 style="text-align:center;">
        <b>\(detailItem.title)</b>
        </h1>
        <body>
        \n
        \(detailItem.body)
        </body>
        </html>
        """
 
        webView.loadHTMLString(html, baseURL: nil)
    }
}
