//
//  ListModel.swift
//  CollapseCellDemo
//
//  Created by Deepu Mishra on 18/03/21.
//

import Foundation

// MARK: - ListModel
struct ListModel: Codable {
    let name: String?
    let subCategory: [SubCategory]?

    enum CodingKeys: String, CodingKey {
        case name
        case subCategory = "sub_category"
    }
}

// MARK: - SubCategory
struct SubCategory: Codable {
    let name, displayName: String?

    enum CodingKeys: String, CodingKey {
        case name
        case displayName = "display_name"
    }
}
typealias ListModelData = [ListModel]
