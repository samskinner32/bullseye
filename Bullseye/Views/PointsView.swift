//
//  PointsView.swift
//  Bullseye
//
//  Created by Sam Skinner on 6/10/22.
//

import SwiftUI

struct ScoreView: View {
  @Binding var isAlertVisible: Bool
  @Binding var sliderValue: CGFloat
  @Binding var game: Game
  
  var body: some View {
    if (game.roundNumber == 3) {
      ResultsView(isAlertVisible: $isAlertVisible, sliderValue: $sliderValue, game: $game)
    } else {
      PointsView(isAlertVisible: $isAlertVisible, sliderValue: $sliderValue, game: $game)
    }
  }
}

struct PointsView: View {
  @Binding var isAlertVisible: Bool
  @Binding var sliderValue: CGFloat
  @Binding var game: Game
  
  var body: some View {
    let roundedValue: Int = Int(sliderValue.rounded())
    let pointsEarned: Int = game.getPointsFromValue(sliderValue)
    VStack(spacing: 8) {
      InstructionText("The slider's value is".uppercased())
      BigNumberText(String(roundedValue))
        .padding(.bottom, 5)
      BodyText("You scored \(pointsEarned) Points\n🎉🎉🎉")
        .padding(.bottom)
      Button(action: {
        withAnimation {
          isAlertVisible = false
        }
      }) {
        ButtonText("Next Round")
      }
    }
    .padding(20)
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(Constants.General.roundRectCornerRadius)
    .shadow(radius: 10, x: 5, y: 5)
    .onDisappear(perform: {
      game.startNewRound(points: pointsEarned)
      withAnimation {
      sliderValue = Constants.Game.startingSliderValue
      }
    })
  }
}

struct ResultsView: View {
  @Binding var isAlertVisible: Bool
  @Binding var sliderValue: CGFloat
  @Binding var game: Game
  
  var body: some View {
    let roundedValue: Int = Int(sliderValue.rounded())
    let pointsEarned: Int = game.getPointsFromValue(sliderValue)
    VStack(spacing: 8) {
      InstructionText("The slider's value is".uppercased())
      BigNumberText(String(roundedValue))
        .padding(.bottom, 5)
      BodyText("You scored \(pointsEarned) Points\n🎉🎉🎉")
        .padding(.bottom)
      BodyText("Your final score is")
      BigNumberText(String(game.score))
        .padding(.bottom)
      Button(action: {
        withAnimation {
          isAlertVisible = false
        }
      }) {
        ButtonText("Start New Game")
      }
    }
    .padding(20)
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(Constants.General.roundRectCornerRadius)
    .shadow(radius: 10, x: 5, y: 5)
    .onDisappear(perform: {
      game.startNewRound(points: pointsEarned)
      withAnimation {
      sliderValue = Constants.Game.startingSliderValue
      }
    })
  }
}

struct PointsView_Previews: PreviewProvider {
  static var isAlertVisible = Binding.constant(false);
  static var sliderValue = Binding.constant(Constants.Game.startingSliderValue);
  static var game = Binding.constant(Game());
  
  static var previews: some View {
    ResultsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game)
      .preferredColorScheme(.dark)
      .previewDevice("iPhone 13 Pro")
    PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game)
      .previewDevice("iPhone 13 Pro")
    PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game)
      .preferredColorScheme(.dark)
      .previewDevice("iPhone 13 Pro")
      .previewInterfaceOrientation(.landscapeLeft)
    PointsView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game)
      .previewDevice("iPhone 13 Pro")
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
