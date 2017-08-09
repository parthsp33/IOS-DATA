//
//  ViewController.swift
//  collectionview
//
//  Created by Tops on 8/3/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    var CollectionviewImg = ["1.jpeg","1.jpg","2.jpg","3.jpeg", "4.jpeg", "5.jpg", "4.jpg", "6.jpg","7.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return  CollectionviewImg.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as UICollectionViewCell
    
        let Img = Cell.viewWithTag(1) as! UIImageView
        
        Img.image = UIImage(named: "\(CollectionviewImg[indexPath.row])")
        
        return Cell
    }

}

