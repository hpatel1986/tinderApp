//
//  ProfileViewController.swift
//  tinderApp
//
//  Created by Hiren Patel on 4/1/18.
//  Copyright © 2018 Hiren Patel. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var profileImage: UIImageView!
    var segueImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.image = segueImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tapDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
