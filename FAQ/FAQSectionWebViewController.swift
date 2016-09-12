//
//  FAQSectionWebViewController.swift
//  FAQ
//
//  Created by Red Davis on 12/09/2016.
//  Copyright © 2016 GVL. All rights reserved.
//

import UIKit
import WebKit


internal final class FAQSectionWebViewController: UIViewController
{
    // Private
    private let section: FAQSection!
    
    private let webView = WKWebView()
    
    // MARK: Initialization
    
    internal required init(section: FAQSection)
    {
        self.section = section
        super.init(nibName: nil, bundle: nil)
        self.title = section.title
    }
    
    internal required init?(coder aDecoder: NSCoder)
    {
        self.section = nil
        super.init(coder: aDecoder)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Webview
        let request = NSURLRequest(URL: self.section.URL!)
        self.webView.loadRequest(request)
        self.view.addSubview(self.webView)
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        self.webView.frame = self.view.bounds
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
