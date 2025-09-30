//
//  HomeModel.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 17.09.25.
//

// MARK: - Match Detail Models

struct MatchDetail {
    let match: LiveScoreMatch
    let goals: [Goal]
    let cards: [Card]
    let substitutions: [Substitution]
}

struct Goal {
    let time: String
    let playerName: String
    let isHomeTeam: Bool
    let assistBy: String?
}

struct Card {
    let time: String
    let playerName: String
    let cardType: CardType
    let isHomeTeam: Bool
    let reason: String?
}

enum CardType {
    case yellow
    case red
    case secondYellow
    
    var emoji: String {
        switch self {
        case .yellow: return "🟨"
        case .red: return "🟥"
        case .secondYellow: return "🟨🟥"
        }
    }
    
    var displayText: String {
        switch self {
        case .yellow: return "Yellow"
        case .red: return "Red"
        case .secondYellow: return "Second Yellow"
        }
    }
}

struct Substitution {
    let time: String
    let playerOut: String
    let playerIn: String
    let isHomeTeam: Bool
}

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

extension MatchDetail {
    static func getMockDetail(for match: LiveScoreMatch) -> MatchDetail {
        if match.homeTeamName.contains("Manchester") && match.awayTeamName.contains("Nottingham") {
            return MatchDetail(
                match: match,
                goals: [
                    Goal(time: "12'", playerName: "Bruno Fernandes", isHomeTeam: true, assistBy: "Marcus Rashford"),
                    Goal(time: "34'", playerName: "Marcus Rashford", isHomeTeam: true, assistBy: nil),
                    Goal(time: "67'", playerName: "Rasmus Højlund", isHomeTeam: true, assistBy: "Bruno Fernandes")
                ],
                cards: [
                    Card(time: "23'", playerName: "Casemiro", cardType: .yellow, isHomeTeam: true, reason: "Tactical foul"),
                    Card(time: "56'", playerName: "Morgan Gibbs-White", cardType: .yellow, isHomeTeam: false, reason: "Dissent")
                ],
                substitutions: [
                    Substitution(time: "62'", playerOut: "Antony", playerIn: "Alejandro Garnacho", isHomeTeam: true),
                    Substitution(time: "75'", playerOut: "Danilo", playerIn: "Ryan Yates", isHomeTeam: false),
                    Substitution(time: "80'", playerOut: "Rasmus Højlund", playerIn: "Anthony Martial", isHomeTeam: true)
                ]
            )
        }
        else if match.homeTeamName.contains("Real") && match.awayTeamName.contains("Barcelona") {
            return MatchDetail(
                match: match,
                goals: [
                    Goal(time: "8'", playerName: "Vinícius Júnior", isHomeTeam: true, assistBy: "Luka Modrić"),
                    Goal(time: "15'", playerName: "Robert Lewandowski", isHomeTeam: false, assistBy: "Pedri"),
                    Goal(time: "23'", playerName: "Rodrygo", isHomeTeam: true, assistBy: "Jude Bellingham"),
                    Goal(time: "31'", playerName: "Pedri", isHomeTeam: false, assistBy: "Gavi"),
                    Goal(time: "43'", playerName: "Jude Bellingham", isHomeTeam: true, assistBy: "Vinícius Júnior"),
                    Goal(time: "52'", playerName: "Gavi", isHomeTeam: false, assistBy: "Raphinha"),
                    Goal(time: "67'", playerName: "Karim Benzema", isHomeTeam: true, assistBy: nil),
                    Goal(time: "74'", playerName: "Raphinha", isHomeTeam: false, assistBy: "Lewandowski"),
                    Goal(time: "82'", playerName: "Luka Modrić", isHomeTeam: true, assistBy: "Federico Valverde"),
                    Goal(time: "89'", playerName: "Ferran Torres", isHomeTeam: false, assistBy: "Ansu Fati")
                ],
                cards: [
                    Card(time: "27'", playerName: "Sergio Busquets", cardType: .yellow, isHomeTeam: false, reason: "Late tackle"),
                    Card(time: "58'", playerName: "Éder Militão", cardType: .yellow, isHomeTeam: true, reason: "Pulling shirt"),
                    Card(time: "76'", playerName: "Ronald Araújo", cardType: .yellow, isHomeTeam: false, reason: "Time wasting"),
                    Card(time: "85'", playerName: "Dani Carvajal", cardType: .yellow, isHomeTeam: true, reason: "Tactical foul")
                ],
                substitutions: [
                    Substitution(time: "60'", playerOut: "Toni Kroos", playerIn: "Eduardo Camavinga", isHomeTeam: true),
                    Substitution(time: "65'", playerOut: "Ansu Fati", playerIn: "Ousmane Dembélé", isHomeTeam: false),
                    Substitution(time: "72'", playerOut: "Federico Valverde", playerIn: "Aurélien Tchouaméni", isHomeTeam: true),
                    Substitution(time: "78'", playerOut: "Sergio Busquets", playerIn: "Frenkie de Jong", isHomeTeam: false),
                    Substitution(time: "85'", playerOut: "Rodrygo", playerIn: "Marco Asensio", isHomeTeam: true)
                ]
            )
        }
        // Default empty match detail
        else {
            return MatchDetail(
                match: match,
                goals: [],
                cards: [],
                substitutions: []
            )
        }
    }
}
