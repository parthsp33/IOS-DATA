//
//  ViewController.swift
//  NewWorkes
//
//  Created by Tops on 8/9/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit
import  CoreData

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    let name = "name"
    let entities  = "Data"
    let branch =  "branch"
    var indexno = 0
    

    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var txtbranch: UITextField!
    @IBOutlet weak var tblview: UITableView!
    @IBOutlet weak var Nextdata: UIButton!
    @IBOutlet weak var savedata: UIButton!
    var Selectname = ""
    var selectbranch = ""
    
    let appDelegateObj : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var  arrayuser = [NSManagedObject]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tblview.register(UITableViewCell.self, forCellReuseIdentifier: "mytbl")
        Nextdata.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
         FillTableview()
    }
    func FillTableview(){
        
        
        let managedContext =  appDelegateObj.persistentContainer.viewContext
        
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: entities)
        
        
        do {
            arrayuser = try managedContext.fetch(fetchRequest)
            tblview.reloadData()
        }
        catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    @IBAction func SaveAnother(_ sender: UIButton) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        
        
        if (savedata.titleLabel?.text == "Save"){
            let entity  = NSEntityDescription.entity(forEntityName: entities, in:  managedContext)!
            
            let newuser  = NSManagedObject(entity: entity, insertInto:managedContext)
            
            newuser.setValue(txtname.text, forKeyPath: name)
            newuser.setValue(txtbranch.text, forKeyPath: branch)
            
            print(newuser)
            
            do {
                try  managedContext.save()
                FillTableview()
            }
            catch{
                print("Couldnot save")
            }
            txtname.text = ""
            txtbranch.text = ""

        }else{
            
            arrayuser[indexno].setValue(txtname.text, forKey: name)
            arrayuser[indexno].setValue(txtbranch.text, forKey: branch)
            do{
                try  self.arrayuser[indexno].managedObjectContext?.save()
                FillTableview()
                txtbranch.text = ""
                txtname.text = ""
                
                savedata.setTitle("Save", for:  UIControlState.normal)
                
                
            }
            catch{
                print( "Error During Update")
            }
        }


        
        
    }
    @IBAction func Save(_ sender: UIButton) {
        
        
        let view = storyboard?.instantiateViewController(withIdentifier: "sec") as! NextView
        
        view.Nextdata = Selectname
        view.Nextdata = selectbranch
        
        
        self.navigationController?.pushViewController(view, animated: true)
        
                  }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayuser.count
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            var Cell = tableView.dequeueReusableCell(withIdentifier: "mytbl")! as  UITableViewCell
            Cell = UITableViewCell(style:  UITableViewCellStyle.subtitle, reuseIdentifier:"mytbl")
        
            Cell.textLabel?.text = "\(arrayuser[indexPath.row].value(forKey: name) as! String)"
            Cell.detailTextLabel?.text = "\(arrayuser[indexPath.row].value(forKey: branch) as! String)"
        
        Selectname = "\(arrayuser[indexPath.row].value(forKey: name) as! String)"
        selectbranch = "\(arrayuser[indexPath.row].value(forKey: branch) as! String)"
        
        
            return  Cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        managedContext.delete(arrayuser[indexPath.row] )
        
        FillTableview()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        indexno = indexPath.row
        txtname.text =  arrayuser[indexPath.row].value(forKey: "name") as? String
        txtbranch.text =  arrayuser[indexPath.row].value(forKey: "branch") as? String
        Selectname = "\(arrayuser[indexPath.row].value(forKey: name) as! String)"
        selectbranch = " \(arrayuser[indexPath.row].value(forKey: branch) as! String)"
        savedata.setTitle("Update", for: UIControlState.normal)
        Nextdata.isHidden = false
        
    }

}

