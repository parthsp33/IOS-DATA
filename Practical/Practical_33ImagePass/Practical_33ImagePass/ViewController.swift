//
//  ViewController.swift
//  Practical_33ImagePass
//
//  Created by Tops on 7/13/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var arrimg = ["1.jpg","2.jpg","3.jpeg","4.jpg","5.jpeg","6.jpg","7.jpg","1.jpg","2.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return  arrimg.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
         let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)  as UICollectionViewCell
//    
//        let images =  cell.viewWithTag(1) as! UIImageView
//            images.image = UIImage(named: arrimg[indexPath.row])
        
        let i = cell.viewWithTag(1) as! UIImageView
        i.image = UIImage(named: arrimg[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let AnotherView = self.storyboard?.instantiateViewController(withIdentifier: "sec")  as!  Anotherview
        
        AnotherView.img = UIImage(named: arrimg[indexPath.row])
        
        
    
        
        self.navigationController?.pushViewController(AnotherView, animated: true)

        
    }

}

