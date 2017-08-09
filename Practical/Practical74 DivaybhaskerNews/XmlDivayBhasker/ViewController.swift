//
//  ViewController.swift
//  XmlDivayBhasker
//
//  Created by Tops on 7/12/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController , XMLParserDelegate , UITableViewDelegate , UITableViewDataSource{

    
    @IBOutlet weak var txtarea: UITextView!
    @IBOutlet weak var descriptionlbl: UILabel!
    @IBOutlet weak var titlelbl: UILabel!
    
    var arrxml = NSMutableArray()
    var arrstring  = ""
    var dicxml =  NSMutableDictionary()
    
    @IBOutlet weak var MyTblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
             let url =  NSURL(fileURLWithPath:   Bundle.main.path(forResource: "d", ofType: "xml")!)
        let xmlparse =  XMLParser(contentsOf: url as URL)
        
        xmlparse?.delegate = self
        xmlparse?.parse()
        //MyTblView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        

    }

    func parserDidStartDocument(_ parser: XMLParser) {
         arrxml = NSMutableArray()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {

            if (elementName == "NewsHeadline")
            {
                dicxml = NSMutableDictionary()
        }
        
        
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
//       strReceiverdData = string
        arrstring =  string
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
   
        if (elementName == "title"  ||  elementName == "shortDescription" || elementName == "description" || elementName == "CDATA")
        {
            
            dicxml.setObject(arrstring, forKey: "title" as  NSString)
            dicxml.setObject(arrstring, forKey: "shortDescription" as NSCopying)
            dicxml.setObject(arrstring, forKey: "description" as NSCopying)
            dicxml.setObject(arrstring, forKey: "CDATA" as  NSString)

        }
        if(elementName == "NewsHeadline"){
            arrxml.add(dicxml)
        }
        
        
        
    }
    func parserDidEndDocument(_ parser: XMLParser) {
        
        
        print(arrxml)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return arrxml.count
    }
    func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell =  tableView.dequeueReusableCell(withIdentifier: "MyCell")
        
      let dduser  = arrxml[indexPath.row] as! NSMutableDictionary
////     
//        let lbl = cell?.viewWithTag(1) as! UILabel
//        lbl.text =  "\(dduser.object(forKey: "title" )!)" as String
//
////        let lbl2 = cell?.viewWithTag(2) as! UILabel
//        lbl2.text = "\(dduser.object(forKey: "shortDescription")!)" as String
//        
//        let labl3 = cell?.viewWithTag(4) as! UILabel
//        labl3.text = "\(dduser.object(forKey: "description")!)" as String
//        
        
        let txtarea = cell?.viewWithTag(3)  as! UITextView
        txtarea.text =  "\(dduser.object(forKey: "CDATA")!)" as String
        
       //cell?.textLabel?.text = "\(dduser.object(forKey: "CDATA")!)"
        
    //    cell?.detailTextLabel?.text = "\(dduser.object(forKey: "description"))"
    
        return cell!
        
    
    }

}

