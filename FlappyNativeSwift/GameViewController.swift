//
//  GameViewController.swift
//  FlappyNativeSwift
//
//  Created by Brian Jordan on 3/23/15.
//  Copyright (c) 2015 Brian Jordan. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var bird: UIImageView!
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var pipeItemBehavior: UIDynamicItemBehavior!
    var birdItemBehavior: UIDynamicItemBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior()
        collision = UICollisionBehavior()
        pipeItemBehavior = UIDynamicItemBehavior()
        birdItemBehavior = UIDynamicItemBehavior()
        
        collision.collisionDelegate = self
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        animator.addBehavior(pipeItemBehavior)
        animator.addBehavior(birdItemBehavior)
        
        gravity.addItem(bird)
        collision.addItem(bird)
        
        birdItemBehavior.addItem(bird)
        
        addPipe()
        NSTimer.scheduledTimerWithTimeInterval(1.2, target: self, selector: "addPipe", userInfo: nil, repeats: true)
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "didTap:"))
    }
    
    func didTap(gesture: UIGestureRecognizer) {
        birdItemBehavior.addLinearVelocity(CGPointMake(0, -700), forItem: self.bird)
    }
    
    func addPipe() {
        var pipeTopView = UIImageView(image: UIImage(named: "pipeTop"))
        self.view.addSubview(pipeTopView)
        var pipeBottomView = UIImageView(image: UIImage(named: "pipeBottom"))
        self.view.addSubview(pipeBottomView)
        
        pipeTopView.center.y = 0
        pipeTopView.center.x = CGRectGetWidth(view.bounds)
        pipeBottomView.center.y = CGRectGetHeight(view.bounds) - 150
        pipeBottomView.center.x = CGRectGetWidth(view.bounds)
        pipeItemBehavior.addItem(pipeTopView)
        pipeItemBehavior.addItem(pipeBottomView)
        collision.addItem(pipeTopView)
        collision.addItem(pipeBottomView)
        pipeItemBehavior.addLinearVelocity(CGPointMake(-500, 0), forItem: pipeTopView)
        pipeItemBehavior.addLinearVelocity(CGPointMake(-500, 0), forItem: pipeBottomView)
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem, atPoint p: CGPoint) {
        
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, endedContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem) {
        
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying, atPoint p: CGPoint) {

    }
    func collisionBehavior(behavior: UICollisionBehavior, endedContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
