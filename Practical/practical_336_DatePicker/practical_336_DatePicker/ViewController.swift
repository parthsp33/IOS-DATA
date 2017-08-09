//
//  ViewController.swift
//  practical_336_DatePicker
//
//  Created by Tops on 7/13/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datepickerviews: UIDatePicker!
    @IBOutlet weak var txt4: UITextField!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet var datepicker: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DatePickeraction(_ sender: UIDatePicker ) {
//        
//        let date = datePicker.date
//        let date1 = datePicker.date
//        let date2 = datePicker.date
//        let date3 = datePicker.date
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd - MM - yyy"
//        let dateFormatter1 = DateFormatter()
//        dateFormatter1.dateFormat = "MM - dd - yyy"
//        let dateFormatter2 = DateFormatter()
//        dateFormatter2.dateFormat = "dd / MM / yyy"
//        let dateFormatter3 = DateFormatter()
//        dateFormatter3.dateFormat = "MM / dd / yyy"
//        lbl1.text = dateFormatter.string(from: date)
//        lbl2.text = dateFormatter1.string(from: date1)
//        lbl3.text = dateFormatter2.string(from: date2)
//        lbl4.text = dateFormatter3.string(from: date3)
        let date1 =  datepickerviews.date
        let date2 =  datepickerviews.date
        let date3 =  datepickerviews.date
        let date4 =  datepickerviews.date
        
        
         let dateformatter1 = DateFormatter()
            dateformatter1.dateFormat = "dd- mm -yyyy"
        let dateformatter2 = DateFormatter()
        dateformatter2.dateFormat = "mm- dd -yyyy"
        
        let dateformatter3 = DateFormatter()
        dateformatter3.dateFormat = "dd // mm // yyyy"
        let dateformatter4 = DateFormatter()
        dateformatter4.dateFormat = "mm // dd // yyyy"
        
        txt1.text = dateformatter1.string(from: date1)
        txt2.text = dateformatter2.string(from: date2)
        txt3.text =  dateformatter3.string(from: date3)
        txt4.text = dateformatter4.string(from: date4)

    }

}

