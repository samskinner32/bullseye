//
//  ContentView.swift
//  Bullseye
//
//  Created by Sam Skinner on 6/7/22.
//

import SwiftUI

struct ContentView: View {
  @State private var isAlertVisible: Bool = false
  @State private var sliderValue: CGFloat = Constants.Game.startingSliderValue
  @State private var game: Game = Game()
  var body: some View {
    ZStack {
      // BackgroundView with buttons and displays
      BackgroundView(sliderValue: $sliderValue, game: $game)
        .blur(radius: isAlertVisible ? 3 : 0)
        .disabled(isAlertVisible)
      
      // All game instructions and controls
      VStack {
        InstructionText("🎯🎯🎯\nPut the bullseye as close as you can to".uppercased())
        BigNumberText(String(game.targetValue))
          .padding(.bottom, 100)
        HitMeButtonView(isAlertVisible: $isAlertVisible, sliderValue: $sliderValue, game: $game)
          .opacity(isAlertVisible ? 0 : 1)
      }
      .padding()
      .blur(radius: isAlertVisible ? 3 : 0)
      
      Color(.black)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .opacity(isAlertVisible ? 0.2 : 0)
      
      // PointsView and SliderView outside the VStack
      VStack {
        if isAlertVisible {
          ScoreView(isAlertVisible: $isAlertVisible, sliderValue: $sliderValue, game: $game)
            .transition(.opacity)
        } else {
          SliderView(sliderValue: $sliderValue)
            .transition(.opacity)
        }
      }
      .padding(.horizontal, 5)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .preferredColorScheme(.dark)
        .previewDevice("iPhone 13 Pro")
      ContentView()
        .previewDevice("iPhone 13 Pro")
      ContentView()
        .preferredColorScheme(.dark)
        .previewDevice("iPhone 13 Pro")
        .previewInterfaceOrientation(.landscapeLeft)
      ContentView()
        .previewDevice("iPhone 13 Pro")
        .previewInterfaceOrientation(.landscapeLeft)
    }
  }
}
