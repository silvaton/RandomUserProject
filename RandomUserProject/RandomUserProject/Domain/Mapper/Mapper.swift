//
//  Mapper.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import Foundation

open class Mapper<T,U> {
    open func mapValue(response: T) -> U {
        fatalError("Subclasses need to implement the `mapValue` method.")
    }
    
    public init() {}
}
