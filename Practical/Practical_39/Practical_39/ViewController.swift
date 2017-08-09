//
//  ViewController.swift
//  Practical_39
//
//  Created by Tops on 7/13/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    
    
    let imagepick = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imagepick.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Action(_ sender: UIButton) {
        
         imagepick.allowsEditing =  true
        imagepick.mediaTypes = UIImagePickerController.availableMediaTypes(for:  .photoLibrary)!
        imagepick.sourceType =  .photoLibrary
        present(imagepick, animated: true, completion: nil)
        
    }


}

