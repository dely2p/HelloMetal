//
//  ViewController.swift
//  HelloMetal
//
//  Created by dely on 2018. 9. 15..
//  Copyright © 2018년 dely. All rights reserved.
//

import UIKit
import Metal

class ViewController: UIViewController {
    
    var device: MTLDevice!


    override func viewDidLoad() {
        super.viewDidLoad()
        device = MTLCreateSystemDefaultDevice()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

