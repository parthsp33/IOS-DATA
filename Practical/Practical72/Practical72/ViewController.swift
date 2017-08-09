//
//  ViewController.swift
//  Practical72
//
//  Created by Tops on 7/10/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate {

        var imagesview  = ["1.jpg", "2.jpg", "3.jpeg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesview.count
    }
    func  collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell =   collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as UICollectionViewCell
        
        
        var Img = cell.viewWithTag(1) as!  UIImageView
    
        Img.image = UIImage(named: imagesview[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let another = self.storyboard?.instantiateViewController(withIdentifier: "Sec") as! Anotherview
        
        another.new = imagesview [indexPath.row]
        
         self.navigationController?.pushViewController(another, animated: true)
        
        }
    


}

