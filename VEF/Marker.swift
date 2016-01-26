//
//  Room.swift
//  VEF
//
//  Created by Colin Rosen on 12/15/15.
//  Copyright © 2015 Colin Rosen. All rights reserved.
//

import Foundation

class Marker {
    private let user : Int
    private var content : String
    private let time : Int
    private let type : MarkerType
    
    init(user : Int, content : String, time : Int, type: MarkerType){
        self.user = user
        self.content = content
        self.time = time
        self.type = type
    }
    
    func getUser() -> Int {
        return self.user
    }
    
    func getContent() -> String {
        return self.content
    }
    
    func getTime() -> Int {
        return self.time
    }
    
    func getType() -> MarkerType {
        return self.type
    }
    
    func toString() -> String {
        let time = Double(self.time)
        let minutes = floor(time / 60)
        let seconds = time - minutes * 60
        
        return "\(self.content) (\(String(format: "%02d", Int(minutes))):\(String(format: "%02d", Int(seconds))))"
    }
    
    func setContent(_ content : String) {
        self.content = content
    }
}

enum MarkerType {
    case QUESTION, REMARK
}