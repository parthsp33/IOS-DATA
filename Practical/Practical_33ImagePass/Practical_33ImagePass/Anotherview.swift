//
//  Anotherview.swift
//  Practical_33ImagePass
//
//  Created by Tops on 7/13/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class Anotherview: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    var img : UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageview.image = img

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
