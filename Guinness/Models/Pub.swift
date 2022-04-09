//
//  Pubs.swift
//  Guinness
//
//  Created by Daniel Farrell on 05/02/2022.
//

import Foundation
import CoreLocation

struct Pub: Codable, Identifiable, Equatable {
  var id: String
  var name: String
  var description: String
  var rating: Double
  var lat: Double
  var long: Double
  var imageName: String

  static func == (lhs: Pub, rhs: Pub) -> Bool {
    lhs.id == rhs.id
  }
}


