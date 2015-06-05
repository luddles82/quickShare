//
//  FirstViewController.swift
//  QuickShare
//
//  Created by Nick Ludlow on 05/06/2015.
//  Copyright (c) 2015 Nick Ludlow. All rights reserved.
//

import UIKit
import Social

class FirstViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func cameraTapped(sender: AnyObject) {
        
        var imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
        
            imagePickerController.sourceType = .Camera
        
        }else{
        
            imagePickerController.sourceType = .PhotoLibrary
        }
        
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    
    @IBAction func shareTapped(sender: AnyObject) {
        
        if imageView.image != nil {
        
        var facebook = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        facebook.addImage(imageView.image)
            
        self.presentViewController(facebook, animated: true, completion: nil)
            
        }else{
        
            println("no image selected to share on FB")
        
        }
        
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

