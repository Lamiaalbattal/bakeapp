//
//  CoursesModel.swift
//  bakeapp
//
//  Created by Maryam on 29/08/1444 AH.
//

import Foundation

// MARK: - Course
struct CoursesModel: Codable {
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

typealias Courses = [CoursesModel]
