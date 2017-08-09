//
//  ViewController.swift
//  TableviewExample
//
//  Created by Tops on 8/3/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    
    var  AllData = ""
     var Array1 = ["Mountain Image ", " Flower Imnage" , "Soung ", "Cricket Player ", "  Sky Images"]
     var Array2 =  ["Abu", "Rose "," Rbata ", "Parth The Lagend ", " Own Sky Iamegs "]
     var Img = ["1.jpg","2.jpg","4.jpg", "6.jpg" , "7.jpg"]
    
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var MyTblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
       // MyTblView.register( UITableViewCell.self, forCellReuseIdentifier:"MyCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var txtfname: UITextField!
    @IBOutlet weak var txtlname: UITextField!
    @IBAction func showdata(_ sender: UIButton) {
    }

    func numberOfSections(in tableView: UITableView) -> Int {
          return  1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array1.count
    }
    func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")! as UITableViewCell
        
        
        
        let lbl1 = Cell.viewWithTag(1)  as! UILabel
        lbl1.text = Array1[indexPath.row]
        
        let lbl2 = Cell.viewWithTag(2) as! UILabel
        lbl2.text = Array2[indexPath.row]
        let Images1 =  Cell.viewWithTag(3)  as! UIImageView
         Images1.image = UIImage(named:  Img[indexPath.row])
        
        return Cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let AnotherViewWithData = self.storyboard?.instantiateViewController(withIdentifier: "Next") as! NextViewViewController
        
        
       
        AnotherViewWithData.NewOnedata = Img[indexPath.row]
        
        self.navigationController?.pushViewController(AnotherViewWithData, animated: true)
        
    }
}

