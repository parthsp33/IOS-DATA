//
//  NextView.swift
//  NewWorkes
//
//  Created by Tops on 8/9/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class NextView: UIViewController {

    var  Nextdata = ""
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

            lbl1.text = Nextdata
        lbl2.text = Nextdata
        
        
        let color : UIColor = UIColor.green
        lbl2.layer.borderColor = color.cgColor
        lbl1.layer.borderColor = color.cgColor
        // Do any additional setup after loading the view.
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
