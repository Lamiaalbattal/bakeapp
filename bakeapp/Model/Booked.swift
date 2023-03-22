//
//  Booked.swift
//  bakeapp
//
//  Created by Lamia Aldossari on 22/03/2023.
//

import Foundation
// MARK: - Course
struct Booked: Codable {
let courseID, status, id, userID: String

enum CodingKeys: String, CodingKey {
case courseID = "course_id"
case status, id
case userID = "user_id"
}
}

//typealias Courses = [Booked]
