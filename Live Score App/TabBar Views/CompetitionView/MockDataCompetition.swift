//
//  MockDataCompetition.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 22.09.25.
//

import UIKit

// MARK: - Results (Past matches with scores)
extension MatchResult {
    static let mock: [MatchResult] = [
        MatchResult(
            homeTeam: "Arsenal",
            homeLogo: "arsenalLogo",
            awayTeam: "Chelsea",
            awayLogo: "chelseaLogo",
            homeScore: 2,
            awayScore: 1,
            status: .finished,
            date: "21 Sep 2025"
        ),
        MatchResult(
            homeTeam: "Barcelona",
            homeLogo: "barcaLogo",
            awayTeam: "Real Madrid",
            awayLogo: "madridLogo",
            homeScore: 1,
            awayScore: 1,
            status: .live(minute: 67),
            date: "22 Sep 2025"
        ),
        MatchResult(
            homeTeam: "Bayern",
            homeLogo: "bayernLogo",
            awayTeam: "Dortmund",
            awayLogo: "bvbLogo",
            homeScore: 0,
            awayScore: 0,
            status: .scheduled,
            date: "23 Sep 2025"
        )
    ]
}

// MARK: - Fixtures (Upcoming matches)
extension Fixture {
    static let mock: [Fixture] = [
        Fixture(
            homeTeam: "Liverpool",
            homeLogo: "liverpoolLogo",
            awayTeam: "Man City",
            awayLogo: "cityLogo",
            date: "24 Sep 2025",
            time: "19:00"
        ),
        Fixture(
            homeTeam: "Juventus",
            homeLogo: "juveLogo",
            awayTeam: "Milan",
            awayLogo: "milanLogo",
            date: "25 Sep 2025",
            time: "21:45"
        )
    ]
}

// MARK: - Standings (League Table)
extension Standing {
    static let mock: [Standing] = [
        Standing(position: 1, clubName: "Man City", played: 5, wins: 5, draws: 0, losses: 0, points: 15),
        Standing(position: 2, clubName: "Arsenal", played: 5, wins: 4, draws: 1, losses: 0, points: 13),
        Standing(position: 3, clubName: "Liverpool", played: 5, wins: 3, draws: 1, losses: 1, points: 10),
        Standing(position: 4, clubName: "Chelsea", played: 5, wins: 2, draws: 1, losses: 2, points: 7)
    ]
}

// MARK: - Player Stats
extension PlayerStat {
    static let mock: [PlayerStat] = [
        PlayerStat(rank: 1, playerName: "Erling Haaland", goals: 7, playerPhoto: "englandFlag"),
        PlayerStat(rank: 2, playerName: "Muhammad Salah", goals: 6, playerPhoto: "englandFlag"),
        PlayerStat(rank: 3, playerName: "John Smith", goals: 5, playerPhoto: "englandFlag"),
        PlayerStat(rank: 4, playerName: "John Snow", goals: 4, playerPhoto: "englandFlag"),
        PlayerStat(rank: 5, playerName: "John Wick", goals: 3, playerPhoto: "englandFlag"),
    ]
}
