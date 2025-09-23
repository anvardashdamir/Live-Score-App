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
            homeLogo: "arsenal",
            awayTeam: "Chelsea",
            awayLogo: "chelsea",
            homeScore: 2,
            awayScore: 1,
            status: .finished,
            date: "21 Sep 2025"
        ),
        MatchResult(
            homeTeam: "Barcelona",
            homeLogo: "barcelona",
            awayTeam: "Real Madrid",
            awayLogo: "realmadrid",
            homeScore: 1,
            awayScore: 1,
            status: .live(minute: 67),
            date: "22 Sep 2025"
        ),
        MatchResult(
            homeTeam: "Bayern",
            homeLogo: "bayern",
            awayTeam: "Dortmund",
            awayLogo: "dortmund",
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
            homeLogo: "liverpool",
            awayTeam: "Man City",
            awayLogo: "mancity",
            date: "24 Sep 2025",
            time: "19:00"
        ),
        Fixture(
            homeTeam: "Arsenal",
            homeLogo: "arsenal",
            awayTeam: "Chelsea",
            awayLogo: "chelsea",
            date: "25 Sep 2025",
            time: "21:45"
        )
    ]
}

// MARK: - Standings (League Table)
extension Standing {
    static let mock: [Standing] = [
        Standing(position: 1, clubName: "Liverpool", played: 5, wins: 5, draws: 0, losses: 0, points: 15),
        Standing(position: 2, clubName: "Arsenal", played: 5, wins: 4, draws: 1, losses: 0, points: 13),
        Standing(position: 3, clubName: "Manchester City", played: 5, wins: 3, draws: 1, losses: 1, points: 10),
        Standing(position: 4, clubName: "Tottenham Hotspur", played: 5, wins: 2, draws: 1, losses: 2, points: 7),
        Standing(position: 5, clubName: "Manchester United", played: 5, wins: 2, draws: 1, losses: 2, points: 7),
        Standing(position: 6, clubName: "Bornemouth", played: 5, wins: 2, draws: 1, losses: 2, points: 7),
        Standing(position: 7, clubName: "Chrystal Palace", played: 5, wins: 2, draws: 1, losses: 2, points: 7),
        Standing(position: 8, clubName: "Chelsea", played: 5, wins: 2, draws: 1, losses: 2, points: 7),
        Standing(position: 9, clubName: "Sunderland", played: 5, wins: 2, draws: 1, losses: 2, points: 7),
        Standing(position: 10, clubName: "Fulham", played: 5, wins: 2, draws: 1, losses: 2, points: 7),
        Standing(position: 11, clubName: "Leeds", played: 5, wins: 2, draws: 1, losses: 2, points: 7),
        Standing(position: 12, clubName: "Newcastle", played: 5, wins: 2, draws: 1, losses: 2, points: 7),
        Standing(position: 13, clubName: "Brighton", played: 5, wins: 2, draws: 1, losses: 2, points: 7),
        Standing(position: 14, clubName: "Nottingham", played: 5, wins: 2, draws: 1, losses: 2, points: 7),
        Standing(position: 15, clubName: "Burnley", played: 5, wins: 2, draws: 1, losses: 2, points: 7),
        Standing(position: 16, clubName: "Brentford", played: 5, wins: 2, draws: 1, losses: 2, points: 7),
        Standing(position: 17, clubName: "Aston Villa", played: 5, wins: 2, draws: 1, losses: 2, points: 7),
        Standing(position: 18, clubName: "Wolves", played: 5, wins: 2, draws: 1, losses: 2, points: 7),
        Standing(position: 19, clubName: "Westham", played: 5, wins: 2, draws: 1, losses: 2, points: 7),
        Standing(position: 20, clubName: "Birmingham", played: 5, wins: 2, draws: 1, losses: 2, points: 7)

    ]
}

// MARK: - Player Stats
extension PlayerStat {
    static let mock: [PlayerStat] = [
        PlayerStat(rank: 1, playerName: "Erling Haaland", goals: 7, playerPhoto: UIImage(named: "englandFlag") ?? UIImage()),
        PlayerStat(rank: 2, playerName: "Muhammad Salah", goals: 6, playerPhoto: UIImage(named: "englandFlag") ?? UIImage()),
        PlayerStat(rank: 3, playerName: "John Smith", goals: 5, playerPhoto: UIImage(named: "englandFlag") ?? UIImage()),
        PlayerStat(rank: 4, playerName: "John Snow", goals: 4, playerPhoto: UIImage(named: "englandFlag") ?? UIImage()),
        PlayerStat(rank: 5, playerName: "John Wick", goals: 3, playerPhoto: UIImage(named: "englandFlag") ?? UIImage()),
    ]
}
