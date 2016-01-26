//
//  MarkerAlert.swift
//  VEF
//
//  Created by Colin Rosen on 12/16/15.
//  Copyright © 2015 Colin Rosen. All rights reserved.
//

import UIKit

class MarkerAlert: UIAlertView {
    private var markerObj : Marker?
    
    var marker : Marker? {
        get {
            return self.markerObj
        }
    }
    
    
    required init?(marker : Marker, title : String, message: String, delegate: UIAlertViewDelegate) {
        super.init(coder: NSCoder.init())
        
        self.markerObj = marker
        super.title = title
        super.message = message
        super.delegate = delegate
        super.addButtonWithTitle("Ok")
        super.addButtonWithTitle("Cancel")
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
