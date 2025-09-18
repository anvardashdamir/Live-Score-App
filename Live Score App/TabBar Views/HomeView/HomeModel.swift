//
//  HomeModel.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 17.09.25.
//

struct LeagueSection {
    let leagueName: String
    let leagueFlag: String
    var matches: [FinalScoreMatch]
}

struct LiveScoreMatch {
    let leagueName: String
    let leagueFlag: String
    let isLive: Bool
    let homeTeamName: String
    let homeTeamLogo: String
    let awayTeamName: String
    let awayTeamLogo: String
    let homeScore: Int
    let awayScore: Int
}


struct FinalScoreMatch {
    let isLive: String
    let homeTeamName: String
    let homeTeamLogo: String
    let awayTeamName: String
    let awayTeamLogo: String
    let homeScore: Int
    let awayScore: Int
    let matchDate: String
}

extension FinalScoreMatch {
    static let premierLeagueMatches: [FinalScoreMatch] = [
        FinalScoreMatch(
            isLive: "FT",
            homeTeamName: "Westham United",
            homeTeamLogo: "westham",
            awayTeamName: "Arsenal",
            awayTeamLogo: "arsenal",
            homeScore: 2,
            awayScore: 2,
            matchDate: "14/9"
        ),
        FinalScoreMatch(
            isLive: "FT",
            homeTeamName: "Chelsea",
            homeTeamLogo: "chelsea",
            awayTeamName: "Brighton & Hove Albion",
            awayTeamLogo: "brighton",
            homeScore: 2,
            awayScore: 1,
            matchDate: "15/9"
        ),
        FinalScoreMatch(
            isLive: "FT",
            homeTeamName: "Manchester City",
            homeTeamLogo: "mancity",
            awayTeamName: "Leicester City",
            awayTeamLogo: "leicester",
            homeScore: 3,
            awayScore: 1,
            matchDate: "14/9"
        ),
    ]
    
    static let laLigaMatches: [FinalScoreMatch] = [
        FinalScoreMatch(
            isLive: "FT",
            homeTeamName: "Barcelona",
            homeTeamLogo: "barcelona",
            awayTeamName: "Valensia",
            awayTeamLogo: "valensia",
            homeScore: 2,
            awayScore: 2,
            matchDate: "14/9"
        )
    ]
    static let bundesLigaMatches: [FinalScoreMatch] = [
        FinalScoreMatch(
            isLive: "FT",
            homeTeamName: "Bayern Munich",
            homeTeamLogo: "bayern",
            awayTeamName: "Borussia Dortmund",
            awayTeamLogo: "dortmund",
            homeScore: 3,
            awayScore: 2,
            matchDate: "11/9"
        ),
        FinalScoreMatch(
            isLive: "FT",
            homeTeamName: "Werder Bremen",
            homeTeamLogo: "werder",
            awayTeamName: "Wolfsburg",
            awayTeamLogo: "wolfsburg",
            homeScore: 0,
            awayScore: 0,
            matchDate: "12/9"
        ),
    ]

}

extension LeagueSection {
    static let mockData: [LeagueSection] = [
        LeagueSection(
            leagueName: "Premier League",
            leagueFlag: "englandFlag",
            matches: FinalScoreMatch.premierLeagueMatches
        ),
        LeagueSection(
            leagueName: "La Liga",
            leagueFlag: "spainFlag",
            matches: FinalScoreMatch.laLigaMatches
        ),
        LeagueSection(
            leagueName: "Bundes Liga",
            leagueFlag: "germanFlag",
            matches: FinalScoreMatch.bundesLigaMatches
        )
    ]
}
