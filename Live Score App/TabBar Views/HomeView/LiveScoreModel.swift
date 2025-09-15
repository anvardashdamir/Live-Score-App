////
////  LiveScoreModel.swift
////  Live Score App
////
////  Created by Dashdemirli Enver on 14.09.25.
////
//
//import UIKit
//
//// MARK: - LiveScore Data Model
//struct LiveScoreMatch {
//    let leagueName: String
//    let leagueFlag: String // Image name or URL
//    let isLive: Bool
//    let homeTeamName: String
//    let homeTeamLogo: String // Image name or URL
//    let awayTeamName: String
//    let awayTeamLogo: String // Image name or URL
//    let homeScore: Int
//    let awayScore: Int
//}
//
//// MARK: - Mock Data
//extension LiveScoreMatch {
//    static let mockData: [LiveScoreMatch] = [
//        LiveScoreMatch(
//            leagueName: "Premier League",
//            leagueFlag: "england_flag", // or URL
//            isLive: true,
//            homeTeamName: "Manchester\nUnited",
//            homeTeamLogo: "man_united_logo", // or URL
//            awayTeamName: "Liverpool\nFC",
//            awayTeamLogo: "liverpool_logo", // or URL
//            homeScore: 2,
//            awayScore: 1
//        ),
//        
//        LiveScoreMatch(
//            leagueName: "La Liga",
//            leagueFlag: "spain_flag", // or URL
//            isLive: false,
//            homeTeamName: "Real\nMadrid",
//            homeTeamLogo: "real_madrid_logo", // or URL
//            awayTeamName: "FC\nBarcelona",
//            awayTeamLogo: "barcelona_logo", // or URL
//            homeScore: 3,
//            awayScore: 2
//        )
//    ]
//}
//
//// MARK: - LiveScoreCell Configuration
//extension LiveScoreCell {
//    func configure(with match: LiveScoreMatch) {
//        // Configure league info
//        leagueLabel.text = match.leagueName
//        leagueFlag.image = UIImage(named: match.leagueFlag) // or load from URL
//        
//        // Configure live status
//        if match.isLive {
//            liveBadge.text = "LIVE"
//            liveBadge.textColor = .systemGreen
//        } else {
//            liveBadge.text = "FT"
//            liveBadge.textColor = .systemRed
//        }
//        
//        // Configure teams
//        homeLabel.text = match.homeTeamName
//        awayLabel.text = match.awayTeamName
//        homeLogo.image = UIImage(named: match.homeTeamLogo) // or load from URL
//        awayLogo.image = UIImage(named: match.awayTeamLogo) // or load from URL
//        
//        // Configure score
//        scoreLabel.text = "\(match.homeScore) - \(match.awayScore)"
//    }
//}
//
//// MARK: - Usage Example
///*
//// In your collection view cell for row at index path:
//let match = LiveScoreMatch.mockData[indexPath.row]
//cell.configure(with: match)
//*/
