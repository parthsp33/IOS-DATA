//
//  ViewController.swift
//  Practical67
//
//  Created by Tops on 7/7/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        
//        if let pdf = Bundle.main.url(forResource: "p", withExtension: "pdf", subdirectory: nil, localization: nil)  {
//            let req = URLRequest(url: pdf)
//            let webView = UIWebView(frame: CGRect(x: 20, y: 20, width: self.view.frame.width-40, height: self.view.frame.height-40))
//            webView.isUserInteractionEnabled=true
//            webView.scalesPageToFit=true
//            webView.loadRequest(req)
//            self.view.addSubview(webView)
//        }
//        
        
        
        
         let PDF = Bundle.main.url(forResource: "p", withExtension: "pdf", subdirectory: nil)
        
        
        let req = URLRequest(url:PDF!)
        let webview = UIWebView(frame: CGRect(x: 20, y : 20, width : self.view.frame.width-40, height: self.view.frame.height-40))
        
        webview.isUserInteractionEnabled = true
        webview.scalesPageToFit = true
        webview.loadRequest(req)
        self.view.addSubview(webview)
 }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

