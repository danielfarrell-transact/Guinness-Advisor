//
//  PubsListView.swift
//  Guinness
//
//  Created by Daniel Farrell on 08/02/2022.
//

import SwiftUI

struct PubsListView: View {

  @EnvironmentObject private var viewModel: PubsViewModel

    var body: some View {
      List {
        ForEach(viewModel.pubs) { pub in
          Button {
            viewModel.showNextLocation(pub: pub)
          } label: {
            listRowView(pub: pub)
          }
            .padding(.vertical, 4)
            .listRowBackground(Color.clear)
        }
      }
      .listStyle(PlainListStyle())
    }
}

struct PubsListView_Previews: PreviewProvider {
    static var previews: some View {
        PubsListView()
        .environmentObject(PubsViewModel())
    }
}


extension PubsListView {

  private func listRowView(pub: Pub) -> some View {
    HStack {
        Image(pub.imageName)
          .resizable()
          .scaledToFill()
          .frame(width: 45, height: 45)
          .cornerRadius(10)

      VStack(alignment: .leading) {
        Text(pub.name)
          .font(.headline)
        Text(pub.name)
          .font(.subheadline)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
}
