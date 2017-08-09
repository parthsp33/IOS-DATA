//
//  ViewController.swift
//  Practical_38
//
//  Created by Tops on 7/13/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var datepickerview: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func action(_ sender: UISegmentedControl) {
        
        
        let date1 =  datepickerview.date
        let date2 =  datepickerview.date
        let date3 =  datepickerview.date
        let date4 =  datepickerview.date

        
        let dateformatter1 = DateFormatter()
        dateformatter1.dateFormat = "dd- mm -yyyy"
        let dateformatter2 = DateFormatter()
        dateformatter2.dateFormat = "mm- dd -yyyy"
        
        let dateformatter3 = DateFormatter()
        dateformatter3.dateFormat = "dd // mm // yyyy"
        let dateformatter4 = DateFormatter()
        dateformatter4.dateFormat = "mm // dd // yyyy"
        
        
        if sender.selectedSegmentIndex == 0 {
            
            txt1.text = dateformatter1.string(from: date1)

            
        }else if  sender.selectedSegmentIndex == 1{
            txt1.text = dateformatter2.string(from: date2)

        }
        else if  sender.selectedSegmentIndex == 2{
            txt1.text = dateformatter3.string(from: date3)
            
        }
        else {
            txt1.text = dateformatter4.string(from: date4)

        
        }

        
    }
    @IBAction func dateAction(_ sender: UIDatePicker) {
        
        
        let date = datepickerview.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd - MM - yyy"
        txt1.text = dateFormatter.string(from: date)
    }

}

