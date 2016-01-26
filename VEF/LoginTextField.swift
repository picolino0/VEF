//
//  LoginTextField.swift
//  VEF
//
//  Created by Colin Rosen on 12/9/15.
//  Copyright © 2015 Colin Rosen. All rights reserved.
//

import UIKit

class LoginTextField: UITextField {

    override func drawRect(rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()

        CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.5, 1.0)
        CGContextSetLineWidth(ctx, 0.75)
        
        CGContextMoveToPoint(ctx, self.bounds.minX, self.bounds.maxY)
        CGContextMoveToPoint(ctx, self.bounds.maxX, self.bounds.maxY)
    }

}
