//
//  ViewController.swift
//  Practical75NewsHub
//
//  Created by Tops on 7/12/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate ,  UITableViewDataSource{
    
    
    @IBOutlet weak var mytbl: UITableView!
    let arrNews = ["BBC News " , " India Tv " , " Tv9" , "Ajj Tak"]
    let NewsUrl  = ["https://www.google.co.in","https://www.bbc.com","https://www.indiatvnews.com/","https://www.tv9live.in/"]
    //www.indiatvnews.com/
    //www.tv9live.in/2012/04/tv9-gujarat-live-streaming-tv9-gujarat.html
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mytbl.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return arrNews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let  cell =  tableView.dequeueReusableCell(withIdentifier: "MyCell")
        
        cell?.textLabel?.text = arrNews[indexPath.row]
        
        return cell!
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      let sec = self.storyboard?.instantiateViewController(withIdentifier: "first")  as! anotherviewViewController
      sec.arrData =  NewsUrl[indexPath.row]
        
        self.navigationController?.pushViewController(sec, animated: true)
        
    }
}







