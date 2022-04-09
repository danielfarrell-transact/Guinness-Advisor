//
//  PubDetailView.swift
//  Guinness
//
//  Created by Daniel Farrell on 09/02/2022.
//

import SwiftUI
import MapKit

struct PubDetailView: View {

    @EnvironmentObject private var viewModel: PubsViewModel
    let pub: Pub

    var body: some View {
      ScrollView {
        VStack {

          Image(pub.imageName)
            .resizable()
            .frame(height: 300)
            .scaledToFit()

          VStack(alignment: .leading, spacing: 16) {
            titleSection
            Divider()
            descriptionSection
            Divider()
            MapLayer
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding()


        }
      }
      .ignoresSafeArea()
      .background(.ultraThinMaterial)
      .overlay(backButton, alignment: .topLeading)
    }
}

struct PubDetailView_Previews: PreviewProvider {
    static var previews: some View {
      PubDetailView(pub: PubLocationData.pubs.first!)
        .environmentObject(PubsViewModel())
    }
}


extension PubDetailView {

  private var titleSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      VStack(alignment: .leading, spacing: 8) {
        Text(pub.name)
          .font(.largeTitle)
          .fontWeight(.semibold)
        reviewSection
      }
    }
  }

  private var descriptionSection: some View {
      VStack(alignment: .leading, spacing: 8) {
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
          .font(.subheadline)
          .foregroundColor(.secondary)

        if let url = URL(string: "https://www.guinness.com/en-us/") {
          Link("See more", destination: url)
            .font(.headline)
            .tint(.blue)
        }
      }
  }


  private var MapLayer: some View {
    Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: pub.lat, longitude: pub.long), span: viewModel.mapSpan)),
        annotationItems: [pub],
        annotationContent: { pub in
        MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: pub.lat, longitude: pub.long)) {
        PubMapAnnotationView()
            .shadow(radius: 10)
      }
    })
      .allowsHitTesting(false)
      .aspectRatio(1, contentMode: .fit)
      .cornerRadius(30)
  }

  private var backButton: some View {
    Button {
      viewModel.sheetPub = nil
    } label: {
      Image(systemName: "xmark")
        .font(.headline)
        .padding(16)
        .foregroundColor(.primary)
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(radius: 4)
        .padding()
    }
  }


  private var reviewSection: some View {
      ZStack{
        HStack {
          Image("full-score")
            .resizable()
            .scaledToFill()
            .frame(width: 25, height: 25)
            .padding(1)
          Image("full-score")
            .resizable()
            .scaledToFill()
            .frame(width: 25, height: 25)
            .padding(1)
          Image("full-score")
            .resizable()
            .scaledToFill()
            .frame(width: 25, height: 25)
            .padding(1)
          Image("full-score")
            .resizable()
            .scaledToFill()
            .frame(width: 25, height: 25)
            .padding(1)
          Image("full-score")
            .resizable()
            .scaledToFill()
            .frame(width: 25, height: 25)
            .padding(1)
        }
      }
      .padding(5)
      .background(Color.black)
      .cornerRadius(10)
    }

}
