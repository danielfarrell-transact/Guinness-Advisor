//
//  PubService.swift
//  Guinness
//
//  Created by Daniel Farrell on 06/02/2022.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

class PubService: ObservableObject {
  
  @Published private(set) var pubs: [Pub] = []
  let db = Firestore.firestore()

  init() {
    getPubs()
  }

  func getPubs() {
    db.collection("pubs").addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("error fetching pubs: \(String(describing: error))")
        return
      }
      self.pubs = documents.compactMap { document -> Pub? in
        do {
          return try document.data(as: Pub.self)
        } catch {
          print("error decoding data into pub: \(error)")
          return nil
        }
      }
    }
  }

}
