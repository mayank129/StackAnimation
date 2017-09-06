//
//  ViewController.swift
//  StackAnimation
//
//  Created by Mayank on 04/09/17.
//  Copyright © 2017 Mayank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var originalCenter:CGPoint?
    var alpha:CGFloat = 1
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet var dragUp: UIPanGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.dragUp = UIPanGestureRecognizer(target: self, action: #selector(increaseStackViewSize(gesture:)))
        self.stackView.addGestureRecognizer(dragUp)
        self.originalCenter = self.stackView.center
        print("origin = \(self.originalCenter!)")
    }
    func increaseStackViewSize(gesture:UIPanGestureRecognizer)
    {
        if  gesture.state == .changed {
            
            UIView.animate(withDuration: 1.5, animations: {
                let translation = gesture.translation(in: self.view)
                print("translate=\(translation)")
                if translation.y < 0 {
                    if gesture.view!.center.y >= (self.view.center.y * 1.8){
                        self.view.backgroundColor = UIColor.white.withAlphaComponent(0)
                        self.stackView.transform = CGAffineTransform(scaleX: 1.5 , y: 1)
                        gesture.view!.center = CGPoint(x: gesture.view!.center.x, y: gesture.view!.center.y + translation.y)
                        print("stackview center=\(self.stackView.center)")
                        gesture.setTranslation(CGPoint.zero, in: self.view)
                        
                    }
                }
                else {
                    if gesture.view!.center.y < self.originalCenter!.y{
                        self.view.backgroundColor = UIColor.white.withAlphaComponent(1)
                        UIView.animate(withDuration: 5, delay:0.6, animations: {
                            self.stackView.transform = CGAffineTransform.identity
                        })
                        
                        gesture.view!.center = CGPoint(x: gesture.view!.center.x, y: gesture.view!.center.y + translation.y)
                        print("geatsure=\(gesture.view!.center.y)")
                        gesture.setTranslation(CGPoint.zero, in: self.view)
                    }
                    
                }
                
            })
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

//CGPoint currentPoint = [aPan locationInView:self];
//
//[UIView animateWithDuration:0.01f
//    animations:^{
//    CGRect oldFrame = _viewToChange.frame;
//    _viewToChange.frame = CGRectMake(oldFrame.origin.x, currentPoint.y, oldFrame.size.width, ([UIScreen mainScreen].bounds.size.height - currentPoint.y));
//    }];
//}
