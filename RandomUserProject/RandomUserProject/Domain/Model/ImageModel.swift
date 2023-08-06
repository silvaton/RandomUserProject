//
//  ImageModel.swift
//  RandomUserProject
//
//  Created by Ton Silva on 5/8/23.
//

import Foundation

public struct ImageModel: Decodable {
    public let largeSize: String?
    public let mediumSize: String?
    public let thumbnail: String?
    
    public init( largeSize: String?,
                 mediumSize: String?,
                 thumbnail: String?) {
        self.largeSize = largeSize
        self.mediumSize = mediumSize
        self.thumbnail = thumbnail
    }
    
    public var defaultImageUrl: String {
        if let defaultImage = largeSize {
            return defaultImage
        } else if let defaultImage = mediumSize {
            return defaultImage
        } else if let defaultImage = thumbnail {
            return defaultImage
        } else {
            return ""
        }
    }
}
