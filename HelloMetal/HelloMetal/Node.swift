//
//  Node.swift
//  HelloMetal
//
//  Created by dely on 2018. 9. 18..
//  Copyright © 2018년 dely. All rights reserved.
//

import Foundation

import Metal
import QuartzCore

class Node {
    
    let device: MTLDevice
    let name: String
    var vertexCount: Int
    var vertexBuffer: MTLBuffer
    
    init(name: String, vertices: Array<Vertex>, device: MTLDevice){
        // 1
        var vertexData = Array<Float>()
        for vertex in vertices{
            vertexData += vertex.floatBuffer()
        }
        
        // 2
        let dataSize = vertexData.count * MemoryLayout.size(ofValue: vertexData[0])
        vertexBuffer = device.makeBuffer(bytes: vertexData, length: dataSize, options: [])!
        
        // 3
        self.name = name
        self.device = device
        vertexCount = vertices.count
    }
    
}
