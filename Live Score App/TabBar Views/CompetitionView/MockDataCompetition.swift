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
            date: "21/9"
        ),
        MatchResult(
            homeTeam: "Barcelona",
            homeLogo: "barcelona",
            awayTeam: "Real Madrid",
            awayLogo: "realmadrid",
            homeScore: 1,
            awayScore: 1,
            date: "22/9"
        ),
        MatchResult(
            homeTeam: "Bayern",
            homeLogo: "bayern",
            awayTeam: "Dortmund",
            awayLogo: "dortmund",
            homeScore: 0,
            awayScore: 0,
            date: "23/9"
        ),
        MatchResult(
            homeTeam: "Bayern",
            homeLogo: "bayern",
            awayTeam: "Dortmund",
            awayLogo: "dortmund",
            homeScore: 2,
            awayScore: 3,
            date: "23/9"
        ),
        MatchResult(
            homeTeam: "Bayern",
            homeLogo: "bayern",
            awayTeam: "Dortmund",
            awayLogo: "dortmund",
            homeScore: 0,
            awayScore: 2,
            date: "23/9"
        ),
        MatchResult(
            homeTeam: "West Ham",
            homeLogo: "westham",
            awayTeam: "Brighton",
            awayLogo: "brighton",
            homeScore: 1,
            awayScore: 0,
            date: "23/9"
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
            date: "24/10",
            time: "19:00"
        ),
        Fixture(
            homeTeam: "Arsenal",
            homeLogo: "arsenal",
            awayTeam: "Chelsea",
            awayLogo: "chelsea",
            date: "25/10",
            time: "21:45"
        ),
        Fixture(
            homeTeam: "Arsenal",
            homeLogo: "arsenal",
            awayTeam: "Chelsea",
            awayLogo: "chelsea",
            date: "25/10",
            time: "21:45"
        ),
        Fixture(
            homeTeam: "Arsenal",
            homeLogo: "arsenal",
            awayTeam: "Chelsea",
            awayLogo: "chelsea",
            date: "25/10",
            time: "21:45"
        ),
        Fixture(
            homeTeam: "Arsenal",
            homeLogo: "arsenal",
            awayTeam: "Chelsea",
            awayLogo: "chelsea",
            date: "25/10",
            time: "21:45"
        ),
        Fixture(
            homeTeam: "Arsenal",
            homeLogo: "arsenal",
            awayTeam: "Chelsea",
            awayLogo: "chelsea",
            date: "25/10",
            time: "21:45"
        ),
    ]
}

// MARK: - Standings (League Table)
extension Standing {
    static let mock: [Standing] = [
        Standing(position: 1, clubName: "Liverpool", played: 10, wins: 10, draws: 0, losses: 0, points: 30),
        Standing(position: 2, clubName: "Arsenal", played: 10, wins: 9, draws: 1, losses: 0, points: 28),
        Standing(position: 3, clubName: "Manchester City", played: 10, wins: 3, draws: 1, losses: 1, points: 27),
        Standing(position: 4, clubName: "Tottenham", played: 10, wins: 2, draws: 1, losses: 2, points: 24),
        Standing(position: 5, clubName: "Manchester United", played: 10, wins: 2, draws: 1, losses: 2, points: 23),
        Standing(position: 6, clubName: "Bornemouth", played: 10, wins: 2, draws: 1, losses: 2, points: 18),
        Standing(position: 7, clubName: "Chrystal Palace", played: 10, wins: 2, draws: 1, losses: 2, points: 17),
        Standing(position: 8, clubName: "Chelsea", played: 10, wins: 2, draws: 1, losses: 2, points: 15),
        Standing(position: 9, clubName: "Sunderland", played: 10, wins: 2, draws: 1, losses: 2, points: 15),
        Standing(position: 10, clubName: "Fulham", played: 10, wins: 2, draws: 1, losses: 2, points: 14),
        Standing(position: 11, clubName: "Leeds", played: 10, wins: 2, draws: 1, losses: 2, points: 12),
        Standing(position: 12, clubName: "Newcastle", played: 10, wins: 2, draws: 1, losses: 2, points: 11),
        Standing(position: 13, clubName: "Brighton", played: 10, wins: 2, draws: 1, losses: 2, points: 11),
        Standing(position: 14, clubName: "Nottingham", played: 10, wins: 2, draws: 1, losses: 2, points: 11),
        Standing(position: 15, clubName: "Burnley", played: 10, wins: 2, draws: 1, losses: 2, points: 9),
        Standing(position: 16, clubName: "Brentford", played: 10, wins: 2, draws: 1, losses: 2, points: 8),
        Standing(position: 17, clubName: "Aston Villa", played: 10, wins: 2, draws: 1, losses: 2, points: 5),
        Standing(position: 18, clubName: "Wolves", played: 10, wins: 2, draws: 1, losses: 2, points: 4),
        Standing(position: 19, clubName: "Westham", played: 10, wins: 2, draws: 1, losses: 2, points: 3),
        Standing(position: 20, clubName: "Birmingham", played: 10, wins: 2, draws: 1, losses: 2, points: 1)
    ]
}

// MARK: - Player Stats
extension PlayerStat {
    static let mock: [PlayerStat] = [
        PlayerStat(rank: 1, playerName: "Erling Haaland", team: "Manchester City", goals: 34, playerPhoto: UIImage(named: "haland") ?? UIImage()),
        PlayerStat(rank: 2, playerName: "Harry Kane", team: "Tottenham", goals: 25, playerPhoto: UIImage(named: "kane") ?? UIImage()),
        PlayerStat(rank: 3, playerName: "Ivan Toney", team: "Brentford", goals: 20, playerPhoto: UIImage(named: "ivan") ?? UIImage()),
        PlayerStat(rank: 4, playerName: "Muhammad Salah", team: "Liverpool", goals: 17, playerPhoto: UIImage(named: "salah") ?? UIImage()),
        PlayerStat(rank: 5, playerName: "Marcus Rashford", team: "Manchester United", goals: 16, playerPhoto: UIImage(named: "rashford") ?? UIImage()),
    ]
}
