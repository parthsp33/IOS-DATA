//
//  ViewController.swift
//  Practical73
//
//  Created by Tops on 7/10/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController,XMLParserDelegate,UITableViewDelegate,UITableViewDataSource {

    var urlData = NSData()
    var strReceivedData:NSString!
    var ddData:NSMutableDictionary!
    var ArrData:NSMutableArray = NSMutableArray()
    var UserId = Int()

    @IBOutlet weak var mytblview: UITableView!
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        LoadServices()
        mytblview.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func LoadServices(){
        
        
        let is_SoapMessage = "<?xml version='1.0' encoding='utf-8'?><soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'><soap:Body><GetAllUsers xmlns='http://tempuri.org/' /></soap:Body></soap:Envelope> "
        let is_URL : String = "http://manageuserservice-1.apphb.com/manageuserservice.asmx?op=GetAllUsers"
        let load_Request  =  NSMutableURLRequest(url:  NSURL(string: is_URL)! as URL)
        let session =   URLSession.shared
        
        load_Request.httpMethod = "POST"
        load_Request.httpBody =  is_SoapMessage.data(using: String.Encoding.utf8)
        load_Request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        load_Request.addValue(String(strlen(is_SoapMessage)), forHTTPHeaderField: "Content-Length")
        load_Request.addValue("http://tempuri.org/GetAllUsers", forHTTPHeaderField: "SOAPAction")
        
        
        let task  = session.dataTask(with: load_Request as URLRequest , completionHandler: {data, response, error -> Void in
                        let xmlParser = XMLParser(data: data!)
                        xmlParser.delegate = self
                        xmlParser.parse()
                    })
        task.resume()
    }
    
    
    @IBAction func SaveData(_ sender: UIButton) {
     
        let is_SoapMessage: String = "<?xml version='1.0' encoding='utf-8'?><soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'><soap:Body><InsertNewUser xmlns='http://tempuri.org/'><FirstName>\(txt1.text!)</FirstName><LastName>\(txt2.text!)</LastName></InsertNewUser></soap:Body></soap:Envelope>"
        
        
        let is_URL: String = "http://manageuserservice-1.apphb.com/manageuserservice.asmx?op=InsertNewUser"
        
        let lobj_Request = NSMutableURLRequest(url: NSURL(string: is_URL)! as URL)
        let session = URLSession.shared
        
        lobj_Request.httpMethod = "POST"
        lobj_Request.httpBody = is_SoapMessage.data(using: String.Encoding.utf8)
        //lobj_Request.addValue("www.cgsapi.com", forHTTPHeaderField: "Host")
        lobj_Request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        lobj_Request.addValue(String(strlen(
            is_SoapMessage)), forHTTPHeaderField: "Content-Length")
        //lobj_Request.addValue("223", forHTTPHeaderField: "Content-Length")
        lobj_Request.addValue("http://tempuri.org/InsertNewUser", forHTTPHeaderField: "SOAPAction")
        
        let task = session.dataTask(with: lobj_Request as URLRequest, completionHandler: {data, response, error -> Void in
            let xmlParser = XMLParser(data: data!)
            xmlParser.delegate=self
            xmlParser.parse()
        })
        task.resume()

    }
    
    
    func parserDidStartDocument(_ parser: XMLParser) {
        
        print(ArrData)
        ArrData = NSMutableArray()
        
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if(elementName == "Table")
        {
            ddData = NSMutableDictionary()
        }
    }
    
    func  parser(_ parser: XMLParser, foundCharacters string: String) {
        
        strReceivedData = string as NSString

    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if(elementName == "InsertNewUserResult")
        {
            print("\(strReceivedData!)")
            LoadServices()
        }
        
        if(elementName == "DeleteUserResult")
        {
            print(strReceivedData!)
            LoadServices()
        }
        
        if(elementName == "userid" || elementName == "fname" || elementName == "lname")
        {
            
            ddData.setObject(strReceivedData!, forKey: elementName as NSCopying)
        }
        
        if(elementName == "Table")
        {
            ArrData.add(ddData)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        mytblview.reloadData()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrData.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")! as UITableViewCell
        
        let ddUsers = ArrData[indexPath.row] as! NSMutableDictionary
        
        cell.textLabel?.text = "\(ddUsers.object(forKey: "userid")!). \(ddUsers.object(forKey: "fname")!) \(ddUsers.object(forKey: "lname")!)";
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let ddUsers = ArrData[indexPath.row] as! NSMutableDictionary
        
        UserId = Int(ddUsers.object(forKey: "userid") as! String)!
        txt1.text = ddUsers.object(forKey: "fname") as? String
        txt2.text = ddUsers.object(forKey: "lname") as? String
    }
    
    @IBAction func DeleteData(_ sender: UIButton) {
       
        let is_SoapMessage: String = "<?xml version='1.0' encoding='utf-8'?><soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'><soap:Body><DeleteUser xmlns='http://tempuri.org/'><UserID>\(UserId)</UserID></DeleteUser></soap:Body></soap:Envelope>"
        
        
        let is_URL: String = "http://manageuserservice-1.apphb.com/manageuserservice.asmx?op=DeleteUser"
        
        let lobj_Request = NSMutableURLRequest(url: NSURL(string: is_URL)! as URL)
        let session = URLSession.shared
        
        lobj_Request.httpMethod = "POST"
        lobj_Request.httpBody = is_SoapMessage.data(using: String.Encoding.utf8)
        //lobj_Request.addValue("www.cgsapi.com", forHTTPHeaderField: "Host")
        lobj_Request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        lobj_Request.addValue(String(strlen(
            is_SoapMessage)), forHTTPHeaderField: "Content-Length")
        //lobj_Request.addValue("223", forHTTPHeaderField: "Content-Length")
        lobj_Request.addValue("http://tempuri.org/DeleteUser", forHTTPHeaderField: "SOAPAction")
        
        let task = session.dataTask(with: lobj_Request as URLRequest, completionHandler: {data, response, error -> Void in
            let xmlParser = XMLParser(data: data!)
            xmlParser.delegate=self
            xmlParser.parse()
        })
        task.resume()
        

        
        
    }
    @IBAction func UpdateData(_ sender: UIButton) {
        
        
        let is_SoapMessage: String = "<?xml version='1.0' encoding='utf-8'?><soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'><soap:Body>'<UpdateUser xmlns='http://mpuri.org/'><UserID>userid</UserID><fname>string</FirstName><LastName>lname</LastName></UpdateUser></soap:Body></soap:Envelope>"
        
        
        let is_URL: String = "http://manageuserservice-1.apphb.com/manageuserservice.asmx?op=UpdateUser"
        
        let lobj_Request = NSMutableURLRequest(url: NSURL(string: is_URL)! as URL)
        let session = URLSession.shared
        
        lobj_Request.httpMethod = "POST"
        lobj_Request.httpBody = is_SoapMessage.data(using: String.Encoding.utf8)
        //lobj_Request.addValue("www.cgsapi.com", forHTTPHeaderField: "Host")
        lobj_Request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        lobj_Request.addValue(String(strlen(
            is_SoapMessage)), forHTTPHeaderField: "Content-Length")
        //lobj_Request.addValue("223", forHTTPHeaderField: "Content-Length")
        lobj_Request.addValue("http://tempuri.org/UpdateUser", forHTTPHeaderField: "SOAPAction")
        
        let task = session.dataTask(with: lobj_Request as URLRequest, completionHandler: {data, response, error -> Void in
            let xmlParser = XMLParser(data: data!)
            xmlParser.delegate=self
            xmlParser.parse()
        })
        task.resume()
        

    
    
    
    }
}

