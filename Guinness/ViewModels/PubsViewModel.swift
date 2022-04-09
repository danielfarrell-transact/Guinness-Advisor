//
//  PubViewModel.swift
//  Guinness
//
//  Created by Daniel Farrell on 07/02/2022.
//

import Foundation
import MapKit
import SwiftUI

class PubsViewModel: ObservableObject {

  //TODO: fetch from firebase - currently from local file
  @Published var pubs: [Pub]

  // current location
  @Published var mapLocation: Pub {
    didSet {
      updateMapRegion(pub: mapLocation)
    }
  }

  // current region on map
  @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
  let mapSpan = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)

  // show list
  @Published var showLocationsList: Bool = false

  // show detail via sheet
  @Published var sheetPub: Pub? = nil

  init() {

    let pubs = PubLocationData.pubs
    self.pubs = pubs
    self.mapLocation = pubs.first!
    self.updateMapRegion(pub: pubs.first!)
  }

  private func updateMapRegion(pub: Pub) {
    withAnimation(.easeInOut) {
      let locationCoordinate = CLLocationCoordinate2D(
          latitude: pub.lat,
          longitude: pub.long)
      mapRegion = MKCoordinateRegion(
          center: locationCoordinate,
          span: mapSpan)
    }
  }

  public func togglePubList() {
    withAnimation(.easeInOut) {
      showLocationsList = !showLocationsList
    }
  }

  public func showNextLocation(pub: Pub) {
    withAnimation(.easeInOut) {
      mapLocation = pub
      showLocationsList = false
    }
  }

  public func nextButtonPressed() {

    // get current index
    guard let currentIndex = pubs.firstIndex(where: { $0 == mapLocation }) else {
      print("couldn't find current index")
      return
    }

    // check if index is valid
    let nextIndex = currentIndex + 1
    guard pubs.indices.contains(nextIndex) else {

      // next index is not valid - start from 0
      guard let firstPub = pubs.first else { return }
      showNextLocation(pub: firstPub)
      return
    }

    // next index is valid
    let nextPub = pubs[nextIndex]
    showNextLocation(pub: nextPub)
  }

}
