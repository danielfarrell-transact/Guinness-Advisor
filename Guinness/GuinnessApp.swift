//
//  GuinnessApp.swift
//  Guinness
//
//  Created by Daniel Farrell on 07/02/2022.
//

import SwiftUI
import Firebase

@main
struct GuinnessApp: App {

  init() {
    FirebaseApp.configure()
  }
  
    var body: some Scene {
        WindowGroup {
            PubsView()
            .environmentObject(PubsViewModel())
        }
    }
}
