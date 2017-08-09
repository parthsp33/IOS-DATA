//
//  ViewController.swift
//  Practical78_json
//
//  Created by Tops on 7/15/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var mytblview: UITableView!
    
    
    var Name :  [String] = []
    var contact : [String] = []
    var ID : [String] =  []
    var Address : [String] =  []
    var Gender : [String] =  []
    var dduserdetail =  NSMutableDictionary()
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       // mytblview.register(UITableViewCell.self, forCellReuseIdentifier:"MyCell")
        
        let url=URL(string:"http://api.androidhive.info/contacts/")
        do {
            let allContactsData = try Data(contentsOf: url!)
            let allContacts = try JSONSerialization.jsonObject(with: allContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            if let arrJSON = allContacts["contacts"] {
                for index in 0...arrJSON.count-1 {
                    
                    var aObject = arrJSON[index] as! [String : AnyObject]
                    
                    Name.append(aObject["name"] as! String)
                    contact.append(aObject["email"] as! String)
                    ID.append(aObject["id"] as! String)
                    Address.append(aObject["address"]  as! String)
                   Gender .append(aObject["gender"] as! String)
                   
                
                    print(aObject)
                
                }
                
                
            }
            
            mytblview.reloadData()
        }
        catch {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Name.count
    }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                print("You selected name : "+Name[indexPath.row])
        }

    
    func tableView(_ tableView: UITableView, cellForRowAt  indexPath: IndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")
        
//        cell =  UITableViewCell.init(style: UITableViewCellStyle.value1, reuseIdentifier: "MyCell")
//        cell?.textLabel?.text=self.Name[indexPath.row]
//        cell?.detailTextLabel?.text = self.contact[indexPath.row]
        
        let Lbl1 = cell?.viewWithTag(1) as! UILabel
        Lbl1.text = self.Name[indexPath.row]
        let Lbl2 = cell?.viewWithTag(2) as! UILabel
        Lbl2.text =  self.contact[indexPath.row]
        
    
        let Lbl3 = cell?.viewWithTag(3) as! UILabel
        Lbl3.text = self.ID[indexPath.row]
        let Lbl4 = cell?.viewWithTag(4) as! UILabel
        Lbl4.text = self.Address[indexPath.row]
        
        
        let Lbl5 = cell?.viewWithTag(5) as! UILabel
        Lbl5.text = self.Gender[indexPath.row]
        
        
        
        
        return cell!
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        
        let Sec  = self.storyboard?.instantiateViewController(withIdentifier: "Next")   as! AnotherViewViewController
        
        Sec.Data = Name[indexPath.row]
        
        self.navigationController?.pushViewController(Sec, animated: true)
        
    }
    
}

