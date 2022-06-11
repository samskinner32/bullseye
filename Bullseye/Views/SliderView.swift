//
//  SliderView.swift
//  Bullseye
//
//  Created by Sam Skinner on 6/8/22.
//

import SwiftUI

struct SliderView: View {
  @Binding var sliderValue: CGFloat
  
  var body: some View {
    HStack {
      Text("1")
        .bold()
        .foregroundColor(Color("TextColor"))
        .frame(width: 40)
      Slider(value: $sliderValue, in: 1.0...100.0)
      Text("100")
        .bold()
        .foregroundColor(Color("TextColor"))
        .frame(width: 35)
    }
  }
}

struct SliderView_Previews: PreviewProvider {
  static var previews: some View {
    SliderView(sliderValue: .constant(Constants.Game.startingSliderValue))
  }
}
