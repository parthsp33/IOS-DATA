//
//  ViewController.swift
//  Practical35_datepicker view
//
//  Created by Tops on 7/13/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePickerview: UIDatePicker!
    @IBOutlet weak var txtdisplay: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DateActionDisplay(_ sender: UIDatePicker) {
        
//        let date = datePicker.date
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd - MM - yyy"
//        lblData.text = dateFormatter.string(from: date)
        
        
        let date =  datePickerview.date
        let datetimmer = DateFormatter()
        datetimmer.dateFormat = "yyy - mm - dd"
        txtdisplay.text = datetimmer.string(from: date)
    }

}

