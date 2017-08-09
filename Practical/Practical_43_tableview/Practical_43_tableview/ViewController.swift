//
//  ViewController.swift
//  Practical_43_tableview
//
//  Created by Tops on 7/13/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate{

    
    
    @IBOutlet weak var tblview: UITableView!
    var arrFname = ["Smeet","Parth","Brijesh"]
    var arrSname = ["Chavda","Prajapati","Patil"]
    var arrImages = ["1.jpg","2.jpg","3.jpeg"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblview.register(UITableViewCell.self, forCellReuseIdentifier: "Mycell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    return arrFname.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell  = tableView.dequeueReusableCell(withIdentifier: "Mycell")! as UITableViewCell
        
        cell =  UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Mycell")
        cell.textLabel?.text = arrFname[indexPath.row]
        cell.detailTextLabel?.text = arrSname[indexPath.row]
      cell.imageView?.image =  UIImage(named:  arrImages[indexPath.row])
        return cell
        
    }
}

