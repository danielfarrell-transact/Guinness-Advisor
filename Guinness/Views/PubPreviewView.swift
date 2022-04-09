//
//  PubPreviewView.swift
//  Guinness
//
//  Created by Daniel Farrell on 08/02/2022.
//

import SwiftUI

struct PubPreviewView: View {

    @EnvironmentObject private var viewModel: PubsViewModel

    let pub: Pub
    var body: some View {

      VStack {
        HStack(alignment: .bottom, spacing: 0) {
          VStack(alignment: .leading, spacing: 16) {
            imageSection
            titleSection
          }

          VStack(spacing: 8) {
            //reviewSection
            nextButton
            learnMoreButton
          }
        }
        .padding(20)
        .background(
          RoundedRectangle(cornerRadius: 10)
          .fill(.ultraThinMaterial)
            .offset(y: 60)
        )
      .cornerRadius(10)
      }
    }
  
  }


struct PubPreviewView_Previews: PreviewProvider {
    static var previews: some View {

      ZStack {
        Color.green.ignoresSafeArea()
        PubPreviewView(pub: PubLocationData.pubs.first!)
          .padding()
      }
      .environmentObject(PubsViewModel())
    }
}



extension PubPreviewView {

  private var imageSection: some View {

      ZStack{
        if let imageName = pub.imageName {
          Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .cornerRadius(10)
        }
      }
      .padding(6)
      .background(Color.white)
      .cornerRadius(10)
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

  private var titleSection: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(pub.name)
        .font(.subheadline)
        .fontWeight(.bold)
      Text(pub.name)
        .font(.subheadline)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }


  private var learnMoreButton: some View {
    Button {
      viewModel.sheetPub = pub
    } label: {
      Text("Learn more")
        .font(.headline)
        .frame(width: 125, height: 35)
    }
    .buttonStyle(.bordered)
  }

  private var nextButton: some View {
    Button {
      // TODO: implement the "Get Directions" functionality
    } label: {
      Text("Directions")
        .font(.headline)
        .frame(width: 125, height: 35)
    }
    .buttonStyle(.borderedProminent)
  }


}




