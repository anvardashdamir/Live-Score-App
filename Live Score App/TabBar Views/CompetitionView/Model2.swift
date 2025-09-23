//
//  Model2.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 22.09.25.
//

// MARK: - Match Result
struct MatchResult {
    let homeTeam: String
    let homeLogo: String
    let awayTeam: String
    let awayLogo: String
    let homeScore: Int
    let awayScore: Int
    let status: MatchStatus
    let date: String
}

enum MatchStatus {
    case live(minute: Int)
    case finished
    case scheduled
}

// MARK: - Fixture (future matches)
struct Fixture {
    let homeTeam: String
    let homeLogo: String
    let awayTeam: String
    let awayLogo: String
    let date: String
    let time: String
}

// MARK: - Standing (league table row)
struct Standing {
    let position: Int
    let clubName: String
    let played: Int
    let wins: Int
    let draws: Int
    let losses: Int
    let points: Int
}

// MARK: - Player Stats
struct PlayerStat {
    let rank: Int
    let playerName: String
    let goals: Int
    let playerPhoto: String
}
