//
//  ViewController.swift
//  JSON PRACTICE
//
//  Created by Tops on 8/3/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    
    var ddarray = NSMutableArray()
    var ddquery  = NSMutableDictionary()
    var Teams = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
         let url=URL(string:"https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20cricket.series.upcoming&format=json&diagnostics=true&env=store%3A%2F%2F0TxIGQMQbObzvU4Apia0V0&callback")
        
        do{
            
            let allContactsData = try Data(contentsOf: url!)
            let allContacts = try JSONSerialization.jsonObject(with: allContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
         //   print(allContacts)
            let  query =  allContacts["query"]  as! [String : Any]
              print(query)
            let Series = allContacts["Series"] as! [String: Any]
            ddarray.add( Series)
            print(ddarray)
      
            
        }
        
        catch let err as NSError {
            print(err.domain)
        }

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

