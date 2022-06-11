//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Sam Skinner on 6/9/22.
//

import SwiftUI

struct BackgroundView: View {
  @Binding var sliderValue: CGFloat
  @Binding var game: Game
  
  var body: some View {
    ZStack {
      VStack {
        TopView(sliderValue: $sliderValue, game: $game)
        Spacer()
        BottomView(game: $game)
      }
      .padding()
      .background(
        RingsView()
      )
    }
  }
}

struct TopView: View {
  @Binding var sliderValue: CGFloat
  @Binding var game: Game
  @State private var isLeaderboardShowing = false
  
  var body: some View {
    HStack {
      Button(action: {
        game.restart()
        sliderValue = Constants.Game.startingSliderValue
      }) {
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      }
      Spacer()
      Button(action: {
        isLeaderboardShowing = true
      }) {
        RoundedImageViewFilled(systemName: "list.dash")
      }
      .sheet(isPresented: $isLeaderboardShowing, onDismiss: {}) {
        LeaderboardView(isLeaderboardShowing: $isLeaderboardShowing, game: $game)
      }
    }
  }
}

struct BottomView: View {
  @Binding var game: Game
  
  var body: some View {
    HStack {
      NumberView(title: "Score".uppercased(), text: String(game.score))
      Spacer()
      NumberView(title: "Round".uppercased(), text: String(game.roundNumber))
    }
  }
}

struct RingsView: View {
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      ForEach(1..<6) { ring in
        let size = CGFloat(ring * 100)
        let envOpacity: CGFloat = colorScheme == .dark ? 0.1 : 0.3
        Circle()
          .inset(by: 10)
          .stroke(lineWidth: 20)
          .fill(
            RadialGradient(gradient: Gradient(colors: [Color("BackgroundCircleColor").opacity(0.8 * envOpacity), Color("BackgroundCircleColor").opacity(0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300)
          )
          .frame(width: size, height: size)
          
      }
    }
    // .opacity(0.3)
  }
}

struct NumberView: View {
  var title: String
  var text: String
  
  var body: some View {
    VStack {
      LabelText(title)
      RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
        .strokeBorder(Color("RoundedButtonBorderColor"), lineWidth: Constants.General.strokeWidth)
        .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
        .overlay(
          InfoNumberText(text)
        )
    }
  }
}

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView(sliderValue: .constant(Constants.Game.startingSliderValue), game: .constant(Game()))
  }
}
