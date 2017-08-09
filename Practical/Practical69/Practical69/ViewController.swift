//
//  ViewController.swift
//  Practical69
//
//  Created by Tops on 7/7/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MyWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let strUrl = URL(string: "https://www.google.co.in/")
        let urlReq =  URLRequest(url: strUrl!)

        MyWebView.loadRequest(urlReq)
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

