//
//  Shapes.swift
//  Bullseye
//
//  Created by Sam Skinner on 6/10/22.
//

import SwiftUI

struct Shapes: View {
  @State private var isWide = true
  var body: some View {
    VStack {
      Capsule()
        .frame(width: isWide ? 250 : 150, height: 100)
      
      Button(action: {
        withAnimation {
          isWide.toggle()
        }
      }) {
        Text("Do it")
      }
    }
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
