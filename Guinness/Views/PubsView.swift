//
//  PubsView.swift
//  Guinness
//
//  Created by Daniel Farrell on 07/02/2022.
//

import SwiftUI
import MapKit

struct PubsView: View {

  @EnvironmentObject private var viewModel: PubsViewModel

    var body: some View {
      ZStack {
        MapLayer
          .ignoresSafeArea()
        VStack(spacing: 0) {
          header
            .padding()
          Spacer()
          PubPreviewStack
      }
    }
    .sheet(item: $viewModel.sheetPub, onDismiss: nil) { pub in
      PubDetailView(pub: pub)
    }
  }
}

struct PubsView_Previews: PreviewProvider {
    static var previews: some View {
        PubsView()
          .environmentObject(PubsViewModel())
    }
}


extension PubsView {

  private var header: some View {
    VStack(spacing: 0) {
      VStack {

        Button(action: viewModel.togglePubList) {
          Text(viewModel.mapLocation.name)
            .font(.title2)
            .fontWeight(.black)
            .foregroundColor(.primary)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .animation(.none, value: viewModel.mapLocation)
            .overlay(alignment: .leading) {
              Image(systemName: "arrow.down")
                .font(.headline)
                .foregroundColor(.primary)
                .padding()
                .rotationEffect(Angle(degrees: viewModel.showLocationsList ? 180 : 0))
            }
        }

        if viewModel.showLocationsList {
          PubsListView()
        }

      }
      .background(.thickMaterial)
      .cornerRadius(10)
      .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
  }


  private var MapLayer: some View {
    Map(coordinateRegion: $viewModel.mapRegion,
        annotationItems: viewModel.pubs,
        annotationContent: { pub in
      MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: pub.lat, longitude: pub.long)) {
        PubMapAnnotationView()
          .scaleEffect(viewModel.mapLocation == pub ? 1 : 0.7)
          .shadow(radius: 10)
          .onTapGesture {
            viewModel.showNextLocation(pub: pub)
          }
      }
    })
  }

  public func getDirections() {
    
    let userLocation = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 53.36764804857322, longitude: -6.266445567775493))
    let pubLocation = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 53.369589369826116, longitude: -6.272019305575081))

    let request = MKDirections.Request()
    request.source = MKMapItem(placemark: userLocation)
    request.destination = MKMapItem(placemark: pubLocation)
    request.transportType = .automobile

    let directions = MKDirections(request: request)
  }


  private var PubPreviewStack: some View {
    ZStack {
      ForEach(viewModel.pubs) { pub in
        if viewModel.mapLocation == pub {
          PubPreviewView(pub: pub)
            .shadow(color: Color.black.opacity(0.3), radius: 20)
            .padding()
            .transition(.asymmetric(insertion: .move(edge: .trailing),
                                    removal: .move(edge: .leading)))
        }
      }
    }
  }


}

