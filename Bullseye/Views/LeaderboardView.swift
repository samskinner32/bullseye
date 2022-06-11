//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Sam Skinner on 6/10/22.
//

import SwiftUI

struct LeaderboardView: View {
  @Binding var isLeaderboardShowing: Bool
  @Binding var game: Game
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      VStack(spacing: 10) {
        HeaderView(isLeaderboardShowing: $isLeaderboardShowing)
        LabelView()
        if (game.leaderboardEntries.isEmpty) {
          InstructionText("No entries yet! 🥇\n"
                          + "Complete 3 rounds to add your score")
          .padding(.top, 40)
        }
        ScrollView {
          VStack(spacing: 10) {
            ForEach(game.leaderboardEntries.indices, id: \.self) { i in
              let entry = game.leaderboardEntries[i]
              RowView(index: i, score: entry.score, date: entry.date)
            }
          }
        }
      }
      .padding(.vertical)
    }
  }
}

struct HeaderView: View {
  @Environment(\.verticalSizeClass) var verticalSize
  @Binding var isLeaderboardShowing: Bool
  
  var body: some View {
    ZStack {
      if (verticalSize != .regular) {
        BigBoldText("Leaderboard")
      }
      HStack {
        if (verticalSize == .regular) {
          BigBoldText("Leaderboard")
            .padding(.leading)
        }
        Spacer()
        Button(action: {
          isLeaderboardShowing = false
        }) {
          RoundedImageViewFilled(systemName: "xmark")
            .padding(.trailing)
        }
      }
    }
  }
}

struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelText("Score".uppercased())
        .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
      Spacer()
      LabelText("Date".uppercased()).frame(width: Constants.Leaderboard.leaderboardDateColWidth)
    }
    .padding(.horizontal)
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
  }
}

struct RowView: View {
  let index: Int
  let score: Int
  let date: Date
  
  var body: some View {
    HStack {
      RoundedTextView(text: String(index + 1))
      Spacer()
      ScoreText(score)
        .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
      Spacer()
      DateText(date)
        .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
    )
    .padding(.horizontal)
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
  }
}

struct LeaderboardView_Previews: PreviewProvider {
  static var previews: some View {
    LeaderboardView(isLeaderboardShowing: .constant(true), game: .constant(Game()))
      .preferredColorScheme(.dark)
      .previewDevice("iPhone 13 Pro")
    LeaderboardView(isLeaderboardShowing: .constant(true), game: .constant(Game()))
      .previewDevice("iPhone 13 Pro")
    LeaderboardView(isLeaderboardShowing: .constant(true), game: .constant(Game()))
      .preferredColorScheme(.dark)
      .previewDevice("iPhone 13 Pro")
      .previewInterfaceOrientation(.landscapeLeft)
    LeaderboardView(isLeaderboardShowing: .constant(true), game: .constant(Game()))
      .previewDevice("iPhone 13 Pro")
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
