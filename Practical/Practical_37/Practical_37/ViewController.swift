//
//  ViewController.swift
//  Practical_37
//
//  Created by Tops on 7/13/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Seg(_ sender: UISegmentedControl) {
        if   sender.selectedSegmentIndex == 0{
            self.view.backgroundColor = UIColor.blue
        }
        else  if   sender.selectedSegmentIndex == 1{
            self.view.backgroundColor = UIColor.black
        }
        else  if   sender.selectedSegmentIndex == 2{
            self.view.backgroundColor = UIColor.red
        }else{
            self.view.backgroundColor = UIColor.brown

        }

    }

}

