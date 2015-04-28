//
//  InterfaceController.swift
//  watch2 WatchKit Extension
//
//  Created by 大可立青 on 15/4/28.
//  Copyright (c) 2015年 大可立青. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var animeImage: WKInterfaceImage!
    @IBAction func startGame() {
        animeImage.setImageNamed("anime")
        animeImage.startAnimatingWithImagesInRange(NSMakeRange(0, 3), duration: 0.3, repeatCount: 3)
        delay(0.9, closure: { () -> () in
            var imageNumber = arc4random_uniform(3)
            self.animeImage.setImageNamed("anime\(imageNumber)")
        })
    }
    
    func delay(delay:Double,closure:()->()){
        var seconds = delay*Double(NSEC_PER_SEC)
        var dtime  = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds))
        dispatch_after(dtime, dispatch_get_main_queue(),closure)
        
    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
