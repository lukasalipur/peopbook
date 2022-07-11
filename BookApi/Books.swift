//
//  Books.swift
//  BookApi
//
//  Created by Luka Šalipur on 7.6.22..
//

import Foundation


struct Books: Codable, Hashable{
    var items: [Items]
}


struct Items: Codable, Hashable{
    var volumeInfo: VolumeInfo
}

struct VolumeInfo: Codable, Hashable{
    var title: String
    var authors: [String]
    var imageLinks: ImageLinks
    let previewLink: String
}

struct ImageLinks: Codable, Hashable{
    var thumbnail: String
}
