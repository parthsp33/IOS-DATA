//
//  ViewController.swift
//  Practical40
//
//  Created by Tops on 7/13/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    
    @IBOutlet weak var mytblview: UITableView!
    var arrData = ["Parth" , "smeet " , "  Jayesh"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mytblview.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell  = tableView.dequeueReusableCell(withIdentifier: "MyCell")! as UITableViewCell
        
        Cell.textLabel?.text =  arrData[indexPath.row]
        
        return Cell
    }

}

