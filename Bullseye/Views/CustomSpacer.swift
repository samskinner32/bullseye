//
//  CustomSpacer.swift
//  Bullseye
//
//  Created by Sam Skinner on 6/9/22.
//

import SwiftUI

struct CustomSpacer: View {
  var width: Double = 0
  var height: Double = 0
  
  var body: some View {
    Color.clear
      .frame(width: width, height: height)
  }
}

struct CustomSpacer_Previews: PreviewProvider {
  static var previews: some View {
    VStack(spacing: 10) {
      CustomSpacer()
      CustomSpacer(width: 10)
      CustomSpacer(height: 10)
      CustomSpacer(width: 20, height: 10)
    }
  }
}
