//
//  CGExtension.swift
//  Sit Next To
//
//  Created by BBlerina on 16.03.20.
//  Copyright © 2020 Blerina Berisha. All rights reserved.
//

import CoreGraphics

extension CGRect {
    init(center: CGPoint, size: CGSize) {
        self.init(x: center.x - size.width / 2.0, y: center.y - size.height / 2.0, width: size.width, height: size.height)
    }
    
    var center: CGPoint { return CGPoint(x: midX, y: midY) }
}

extension CGSize {
    var innerRadius: CGFloat { return min(width, height) / 2.0 }
}
