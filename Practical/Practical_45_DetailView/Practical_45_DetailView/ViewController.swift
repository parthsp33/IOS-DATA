//
//  ViewController.swift
//  Practical_45_DetailView
//
//  Created by Tops on 7/13/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    
    var arrName = ["Smeet","Parth","Brijesh","Anshit"]

    @IBOutlet weak var MyTbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyTbl.register(UITableViewCell.self , forCellReuseIdentifier: "MyCell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell =  tableView.dequeueReusableCell(withIdentifier:  "MyCell")! as UITableViewCell
        
         cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Mycell")
        
        cell.accessoryType =  UITableViewCellAccessoryType.detailButton
        //cell.accessoryType = UITableViewCellAccessoryType.checkmark
        
        cell.textLabel?.text = arrName[indexPath.row]
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let next = self.storyboard?.instantiateViewController(withIdentifier: "sec") as! AnotherviewViewController
    
        next.data = arrName[indexPath.row]
        
        self.navigationController?.pushViewController(next, animated: true)
        
    
    }

}

