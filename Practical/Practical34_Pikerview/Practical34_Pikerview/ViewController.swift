//
//  ViewController.swift
//  Practical34_Pikerview
//
//  Created by Tops on 7/13/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{

     var studata = ["Jacky", "denial","rock", "popon","Naval"]
    var facdata = ["Jackysd", "denial2","rock2", "popon2","Naval2"]

    
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0){
            return studata.count
        }
        else{
            
            return facdata.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if (component == 0){
            return studata[row]
        }
        else{
            
            return facdata[row]
        }

    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0){
            txt1.text = studata[row]
          
        }
        else {
            txt2.text = facdata[row]
        }
        
    }
}

