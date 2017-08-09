//
//  anotherviewViewController.swift
//  Practical75NewsHub
//
//  Created by Tops on 7/12/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class anotherviewViewController: UIViewController {
    
    
    var arrData =  ""
    
    @IBOutlet weak var webview: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        if !arrData.isEmpty {
        
            print(arrData)
            
            if let url = URL(string: arrData) {
            
            
        let request = URLRequest(url: url)
        webview.loadRequest(request)
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
//www.bbc.com/
    //aajtak.intoday.in/
    
    
    
    
    


}
