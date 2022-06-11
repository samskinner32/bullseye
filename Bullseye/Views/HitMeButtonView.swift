//
//  HitMeButtonView.swift
//  Bullseye
//
//  Created by Sam Skinner on 6/9/22.
//

import SwiftUI

struct HitMeButtonView: View {
  @Binding var isAlertVisible: Bool
  @Binding var sliderValue: CGFloat
  @Binding var game: Game
  
  let borderRadius: CGFloat = Constants.General.roundRectCornerRadius
  
  var body: some View {
    let pointsEarned: Int = game.getPointsFromValue(sliderValue)
    Button(action: {
      game.addPointsToScore(points: pointsEarned)
      withAnimation {
        isAlertVisible = true
      }
    }) {
      VStack {
        Text("Hit Me".uppercased())
          .bold()
          .font(.title3)
      }
      .padding(EdgeInsets(top: 22, leading: 24, bottom: 22, trailing: 24))
    }
    .background(
      ZStack {
        Color("HitMeColor")
        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
      }
    )
    .foregroundColor(.white)
    .cornerRadius(borderRadius)
    .overlay(
      RoundedRectangle(cornerRadius: borderRadius)
        .strokeBorder(.white, lineWidth: Constants.General.strokeWidth)
    )
  }
}
