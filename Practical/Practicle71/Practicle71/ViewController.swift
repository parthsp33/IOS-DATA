//
//  ViewController.swift
//  Practicle71
//
//  Created by Tops on 7/7/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UICollectionViewController ,UIImagePickerControllerDelegate{

    
    
    
    @IBOutlet weak var imageView: UIImageView!
        
    let galleryPicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(openPicker))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        if let url = UserDefaults.standard.url(forKey: "assetURL"),
            let asset = PHAsset.fetchAssets(withALAssetURLs: [url], options: PHFetchOptions()).firstObject {
            fetchImage(asset: asset) { self.imageView.image = $0 }
        }
        
    }
    func fetchImage(asset: PHAsset, completion: @escaping  (UIImage) -> ()) {
        let options = PHImageRequestOptions()
        options.version = .original
        PHImageManager.default().requestImageData(for: asset, options: options) {
            data, uti, orientation, info in
            guard let data = data, let image = UIImage(data: data) else { return }
            self.imageView.contentMode = .scaleAspectFit
            self.imageView.image = image
            print("image size:", image.size)
            completion(image)
        }
        func openPicker() {
            galleryPicker.sourceType = .photoLibrary
            galleryPicker.delegate = self
            present(galleryPicker, animated: true)
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true)
            print("canceled")
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
            if let url = info[UIImagePickerControllerReferenceURL] as? URL,
                let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                UserDefaults.standard.set(url, forKey: "assetURL")
                print("url saved")
                self.imageView.image = image
            }
            dismiss(animated: true)
        }

        

}

