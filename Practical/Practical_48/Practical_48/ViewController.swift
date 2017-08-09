//
//  ViewController.swift
//  Practical_48
//
//  Created by Tops on 7/13/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var myTblview: UITableView!
    
    var arrStudent = ["Smeet","Brijesh","Anshit","Viral","Bunny"]
    override func viewDidLoad() {
        super.viewDidLoad()
       myTblview.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStudent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")! as UITableViewCell
        cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "MyCell")
        cell.textLabel?.text = arrStudent[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete{
//            arrStudent.remove(at: indexPath.row)
//            myTblview.deleteRows(at: [indexPath], with:.fade)
//        }
 
        if  editingStyle == .delete{
            arrStudent.remove(at: indexPath.row)
            myTblview.deleteRows(at:  [indexPath], with: .fade)
        }
    
    }

}

