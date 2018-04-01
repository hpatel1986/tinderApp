//
//  CardsViewController.swift
//  tinderApp
//
//  Created by Hiren Patel on 4/1/18.
//  Copyright © 2018 Hiren Patel. All rights reserved.
//

import UIKit



class CardsViewController: UIViewController {
    
    var cardInitialCenter: CGPoint!
    @IBOutlet weak var cardView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("launched tinder")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPanCardView(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let cardPosition = cardView.center.x - view.center.x
        
        if sender.state == .began {
            cardInitialCenter = cardView.center
            
        } else if sender.state == .changed {
            cardView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
            cardView.transform = CGAffineTransform(rotationAngle: CGFloat(1 * Double.pi / 180))
            
            if cardPosition > 0 {
                cardView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(cardPosition) * Double.pi / 360))
            } else{
                cardView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(cardPosition) * Double.pi / 360))
            }
        } else if sender.state == .ended {
            
            if (cardPosition > 50) {
                UIView.animate(withDuration: 0.5) {
                    self.cardView.center = CGPoint(x: self.cardInitialCenter.x + 500, y: self.cardInitialCenter.y)
                }
            } else if (cardPosition < -50) {
                UIView.animate(withDuration: 0.3) {
                    self.cardView.center = CGPoint(x: self.cardInitialCenter.x - 500, y: self.cardInitialCenter.y)
                }
            }
        }
    }
    
    @IBAction func onImageTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "profileSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "profileSegue") {
            let profileViewController = segue.destination as! ProfileViewController
            profileViewController.segueImage = cardView.image
        }
    }
    
}

