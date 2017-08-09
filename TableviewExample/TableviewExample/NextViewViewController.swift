//
//  NextViewViewController.swift
//  TableviewExample
//
//  Created by Tops on 8/3/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class NextViewViewController: UIViewController {

    var NewOnedata = ""
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblname2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

      imgview.image =  UIImage(named: "\(NewOnedata)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
