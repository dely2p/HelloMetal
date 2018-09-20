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
    var objectToDraw: Cube!
    var pipelineState: MTLRenderPipelineState!
    var commandQueue: MTLCommandQueue!
    var timer: CADisplayLink!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        device = MTLCreateSystemDefaultDevice()
        
        metalLayer = CAMetalLayer ()
        metalLayer.device = device
        metalLayer.pixelFormat = .bgra8Unorm
        metalLayer.framebufferOnly = true
        metalLayer.frame = view.layer.frame
        view.layer.addSublayer(metalLayer)
        
        objectToDraw = Cube(device: device)
        
        objectToDraw.positionX = -0.25
        objectToDraw.rotationZ = Matrix4.degrees(toRad: 45)
        objectToDraw.scale = 0.5
        
        let defaultLibrary = device.makeDefaultLibrary()!
        let fragmentProgram = defaultLibrary.makeFunction(name: "basic_fragment")
        let vertexProgram = defaultLibrary.makeFunction(name: "basic_vertex")
        
        let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
        pipelineStateDescriptor.vertexFunction = vertexProgram
        pipelineStateDescriptor.fragmentFunction = fragmentProgram
        pipelineStateDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        
        pipelineState = try! device.makeRenderPipelineState(descriptor: pipelineStateDescriptor)
        
        commandQueue = device.makeCommandQueue ()
        
        timer = CADisplayLink(target: self, selector: #selector(ViewController.gameloop))
        timer.add(to: RunLoop.main, forMode: RunLoopMode.defaultRunLoopMode)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func render() {
        guard let drawable = metalLayer?.nextDrawable() else { return }
        objectToDraw.render(commandQueue: commandQueue, pipelineState: pipelineState, drawable: drawable, clearColor: nil)
    }

    
    @objc func gameloop() {
        autoreleasepool {
            self.render()
        }
    }

}

