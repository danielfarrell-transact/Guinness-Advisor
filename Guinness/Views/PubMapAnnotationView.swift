//
//  PubMapAnnotationView.swift
//  Guinness
//
//  Created by Daniel Farrell on 08/02/2022.
//

import SwiftUI

struct PubMapAnnotationView: View {

    let accentColor = Color("Blue")

    var body: some View {
      VStack(spacing: 0) {
        Image("map-annotation")
          .resizable()
          .scaledToFit()
          .frame(width: 30, height: 30)
          .font(.headline)
          .foregroundColor(.white)
          .padding(6)
          .background(accentColor)
          .cornerRadius(36)

        Image(systemName: "triangle.fill")
          .resizable()
          .scaledToFit()
          .foregroundColor(accentColor)
          .frame(width: 10, height: 10)
          .rotationEffect(Angle(degrees: 180))
          .offset(y: -3)
          .padding(.bottom, 40)
      }
    }
}

struct PubMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        Color.red.ignoresSafeArea()
        PubMapAnnotationView()
      }
    }
}
