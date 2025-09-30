//
//  Model.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 18.09.25.
//

import UIKit

struct LeaugeTitle{
    let countryName: String
    let leagueName: String
    let countryFlag: String
}

struct MatchResult {
    let homeTeam: String
    let homeLogo: String
    let awayTeam: String
    let awayLogo: String
    let homeScore: Int
    let awayScore: Int
    let date: String
    let isLive: String = "FT"
}

struct Fixture {
    let homeTeam: String
    let homeLogo: String
    let awayTeam: String
    let awayLogo: String
    let date: String
    let time: String
}

struct Standing {
    let position: Int
    let clubName: String
    let played: Int
    let wins: Int
    let draws: Int
    let losses: Int
    let points: Int
}

struct PlayerStat {
    let rank: Int
    let playerName: String
    let team: String
    let goals: Int
    let playerPhoto: UIImage
}
