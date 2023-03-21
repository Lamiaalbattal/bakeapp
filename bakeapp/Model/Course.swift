//
//  Product.swift
//  bakeapp
//
//  Created by Lamia Aldossari on 14/03/2023.
//

import Foundation
import UIKit
// MARK: - Course
struct Course: Codable {
    let startDate: Double
    let locationLongitude: String
    let level: Level
    let image: String
    let chefID, title, locationName, locationLatitude: String
    let id, description: String
    let endDate: Double

    enum CodingKeys: String, CodingKey {
        case startDate = "start_date"
        case locationLongitude = "location_longitude"
        case level, image
        case chefID = "chef_id"
        case title
        case locationName = "location_name"
        case locationLatitude = "location_latitude"
        case id, description
        case endDate = "end_date"
    }
}

enum Level: String, Codable {
    case advance = "advance"
    case beginner = "beginner"
    case intermediate = "intermediate"
}

typealias Courses = [Course]

