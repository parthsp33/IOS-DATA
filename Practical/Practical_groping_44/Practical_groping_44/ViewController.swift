//
//  ViewController.swift
//  Practical_groping_44
//
//  Created by Tops on 7/13/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    
    
    let arrStudents = [["A","Ashwin","Anand","Anil","Anshit","Angad"],["C","Chinmay","Charlie","Chandni"],["B","Brijesh","Bandish","Binal","Bobby"],["D","Dhaval","Dhruv","Dimple","Dinky","Denny"]]
    
    
    
    @IBOutlet weak var mytbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mytbl.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrStudents.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStudents[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell  = tableView.dequeueReusableCell(withIdentifier: "MyCell") as  UITableViewCell?

        
        cell = UITableViewCell(style:  UITableViewCellStyle.default, reuseIdentifier: "MyCell")
        cell?.textLabel?.text = arrStudents[indexPath.section][indexPath.row]
       
        
        return cell!
        
        
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         return arrStudents[section][0]
    }

    
    
}

