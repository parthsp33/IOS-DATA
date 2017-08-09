//
//  ViewController.swift
//  Practical32_passValues
//
//  Created by Tops on 7/13/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func SendData(_ sender: UIButton) {
        
        
        let next =  self.storyboard?.instantiateViewController(withIdentifier: "sec") as! AnotherView
        
        next.Data = txt.text!
        
        self.navigationController?.pushViewController(next, animated: true)
    }


}

