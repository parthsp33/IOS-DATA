//
//  ViewController.swift
//  xmlParsing
//
//  Created by Tops on 8/3/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController , XMLParserDelegate , UITableViewDelegate, UITableViewDataSource{

    
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var title1 = NSMutableString()
    var date = NSMutableString()
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf:(NSURL(string:"http://images.apple.com/main/rss/hotnews/hotnews.rss"))! as URL)!
        parser.delegate = self
        parser.parse()
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "item")
        {
            elements = NSMutableDictionary()
            elements = [:]
            title1 = NSMutableString()
            title1 = ""
            date = NSMutableString()
            date = ""
        }
    }
    func parserDidStartDocument(_ parser: XMLParser) {
        
        
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if element.isEqual(to: "title") {
            title1.append(string)
        } else if element.isEqual(to: "pubDate") {
            date.append(string)
        }
    }
    func parserDidEndDocument(_ parser: XMLParser) {
            }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if (elementName as NSString).isEqual(to: "item") {
            if !title1.isEqual(nil) {
                elements.setObject(title1, forKey: "title" as NSCopying)
            }
            if !date.isEqual(nil) {
                elements.setObject(date, forKey: "date" as NSCopying)
            }
            
            posts.add(elements)
        }

        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        //cell.textLabel?.text =  ((posts.object(at: indexPath.row) as AnyObject).value("title") as! NSString) as NSString
//        cell.textLabel?.text = ((posts.object(at: indexPath.row) as AnyObject).value("title") as! NSString) as NSString
//        cell.detailTextLabel?.text = ((posts.object(at: indexPath.row) as AnyObject).value("date") as! NSString) as String
        
        return cell as UITableViewCell
    }

}

