//
//  Vertex.swift
//  HelloMetal
//
//  Created by dely on 2018. 9. 18..
//  Copyright © 2018년 dely. All rights reserved.
//

import Foundation

struct Vertex{
    
    var x,y,z: Float     // position data
    var r,g,b,a: Float   // color data
    
    func floatBuffer() -> [Float] {
        return [x,y,z,r,g,b,a]
    }
    
}
