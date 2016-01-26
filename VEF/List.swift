//
//  List.swift
//  VEF
//
//  Created by Colin Rosen on 12/15/15.
//  Copyright © 2015 Colin Rosen. All rights reserved.
//

import Foundation

class List<T> : SequenceType {
    private var items : [T?]
    
    var count : Int {
        get {
            return self.items.count
        }
    }
    
    subscript(index : Int) -> T? {
        return self.items[index]
    }
    
    init () {
        self.items = [T?]()
    }
    
    // Copy another list
    init (other : List<T>) {
        self.items = other.items
    }
    
    // Copy an array
    init (other : [T]) {
        self.items = [T?]()
        self.addAll(other)
    }
    
    // Add single item
    func add (item : T) {
        var newItems : [T?] = [T?](count: (self.items.count + 1), repeatedValue: nil)
    
        var index : Int = 0
        for it in self.items {
            if it == nil {
                continue
            }
            newItems[index] = it
            
            index++
        }
        
        newItems[self.items.count] = item
        
        self.items = newItems
    }
    
    // Add items from list
    func addAll (items : List<T>) {
        for it in items {
            let item : T? = it
            self.add(item!)
        }
    }
    
    // Add items from array
    func addAll (items : [T]) {
        for it in items {
            self.add(it)
        }
    }
    
    // Remove item at index
    func removeAt (index : Int) {
        let newList = List<T>()
        
        for i in 0...self.items.count {
            if i != index {
                newList.add(self.items[i]!)
            }
        }
        
        self.items = newList.items
    }
    
    // Get item at index
    func get (index : Int) -> T? {
        if index > self.items.count || index < 0 {
            NSException(name: "IndexOutOfRange", reason: "Index is out of range", userInfo: nil).raise()
        }
        
        return self.items[index]
    }
    
    // Iterator function
    func generate() -> AnyGenerator<T?> {
        // keep the index of the next item in the iteration
        var nextIndex = self.items.count-1
        
        // Construct an AnyGenerator<T?> instance, passing a closure that returns the next item in the iteration
        return anyGenerator {
            if (nextIndex < 0) {
                return nil
            }
            return self.items[nextIndex--]
        }
    }
}