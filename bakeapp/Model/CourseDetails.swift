//
//  CourseDetails.swift
//  bakeapp
//
//  Created by Amani Almutairi  on 29/08/1444 AH.
//


import Foundation

// MARK: - Welcome
struct CourseDetails: Codable {
    let image: String
    let endDate, startDate: Double
    let title, level, chefID, locationLatitude: String
    let id, locationName, description, locationLongitude: String

    enum CodingKeys: String, CodingKey {
        case image
        case endDate = "end_date"
        case startDate = "start_date"
        case title, level
        case chefID = "chef_id"
        case locationLatitude = "location_latitude"
        case id
        case locationName = "location_name"
        case description
        case locationLongitude = "location_longitude"
    }
}
