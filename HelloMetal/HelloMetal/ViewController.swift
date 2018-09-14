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
    var metalLayer: CAMetalLayer!
    let vertexData:[Float] = [
        0.0, 1.0, 0.0,
        -1.0, -1.0, 0.0,
        1.0, -1.0, 0.0
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        device = MTLCreateSystemDefaultDevice()
        
        metalLayer = CAMetalLayer ()
        metalLayer.device = device
        metalLayer.pixelFormat = .bgra8Unorm
        metalLayer.framebufferOnly = true
        metalLayer.frame = view.layer.frame
        view.layer.addSublayer(metalLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

