//
//  ViewController.swift
//  Practical42_singleTbl_twodiffArray
//
//  Created by Tops on 7/13/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    
    var Data = ["Smeet","Brijesh","Parth","Anshit"]
    var arrSname = ["Chavda","Patil","Prajapati","Arora"]
    
    @IBOutlet weak var MyTblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        MyTblView.register( UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ( section == 0){
            return Data.count
        }else{
            return arrSname.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        

    var cell =  tableView.dequeueReusableCell(withIdentifier: "MyCell")! as UITableViewCell
        
     cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "MyCell")
        
   // cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "MyCell")
    
        
    cell.detailTextLabel?.text = Data[indexPath.row]
    cell.textLabel?.text = arrSname[indexPath.row]
        
    return cell
        
    }

}

