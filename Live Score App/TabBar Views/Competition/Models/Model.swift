//
//  Model.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 29.09.25.
//

struct Club {
    let id: String
    let name: String
    let logo: String
    let league: String
    let leagueFlag: String
    let stadium: String
    let founded: String
    let manager: String
    let players: [Player]
}

struct Player {
    let name: String
    let number: String
    let position: PlayerPosition
    let nationality: String
    let age: String
}

enum PlayerPosition: String {
    case goalkeeper = "GK"
    case defender = "DEF"
    case midfielder = "MID"
    case forward = "FWD"
}

extension Club {
    static let mockClubs: [Club] = [
        Club(
            id: "1",
            name: "Manchester United",
            logo: "manutd",
            league: "Premier League",
            leagueFlag: "englandFlag",
            stadium: "Old Trafford",
            founded: "1878",
            manager: "Erik ten Hag",
            players: [
                Player(name: "André Onana", number: "24", position: .goalkeeper, nationality: "Cameroon", age: "27"),
                Player(name: "Lisandro Martínez", number: "6", position: .defender, nationality: "Argentina", age: "26"),
                Player(name: "Bruno Fernandes", number: "8", position: .midfielder, nationality: "Portugal", age: "29"),
                Player(name: "Marcus Rashford", number: "10", position: .forward, nationality: "England", age: "26"),
                Player(name: "Rasmus Højlund", number: "11", position: .forward, nationality: "Denmark", age: "21")
            ]
        ),
        Club(
            id: "2",
            name: "Real Madrid",
            logo: "realmadrid",
            league: "La Liga",
            leagueFlag: "spainFlag",
            stadium: "Santiago Bernabéu",
            founded: "1902",
            manager: "Carlo Ancelotti",
            players: [
                Player(name: "Thibaut Courtois", number: "1", position: .goalkeeper, nationality: "Belgium", age: "31"),
                Player(name: "Éder Militão", number: "3", position: .defender, nationality: "Brazil", age: "26"),
                Player(name: "Jude Bellingham", number: "5", position: .midfielder, nationality: "England", age: "20"),
                Player(name: "Vinícius Júnior", number: "7", position: .forward, nationality: "Brazil", age: "23"),
                Player(name: "Luka Modrić", number: "10", position: .midfielder, nationality: "Croatia", age: "38")
            ]
        ),
        Club(
            id: "3",
            name: "FC Barcelona",
            logo: "barcelona",
            league: "La Liga",
            leagueFlag: "spainFlag",
            stadium: "Camp Nou",
            founded: "1899",
            manager: "Xavi Hernández",
            players: [
                Player(name: "Marc-André ter Stegen", number: "1", position: .goalkeeper, nationality: "Germany", age: "31"),
                Player(name: "Ronald Araújo", number: "4", position: .defender, nationality: "Uruguay", age: "25"),
                Player(name: "Pedri", number: "8", position: .midfielder, nationality: "Spain", age: "21"),
                Player(name: "Robert Lewandowski", number: "9", position: .forward, nationality: "Poland", age: "35"),
                Player(name: "Gavi", number: "6", position: .midfielder, nationality: "Spain", age: "19")
            ]
        ),
        Club(
            id: "4",
            name: "Nottingham Forest",
            logo: "forest",
            league: "Premier League",
            leagueFlag: "englandFlag",
            stadium: "City Ground",
            founded: "1865",
            manager: "Steve Cooper",
            players: [
                Player(name: "Matt Turner", number: "1", position: .goalkeeper, nationality: "USA", age: "29"),
                Player(name: "Murillo", number: "5", position: .defender, nationality: "Brazil", age: "21"),
                Player(name: "Morgan Gibbs-White", number: "10", position: .midfielder, nationality: "England", age: "23"),
                Player(name: "Chris Wood", number: "11", position: .forward, nationality: "New Zealand", age: "32"),
                Player(name: "Danilo", number: "28", position: .midfielder, nationality: "Brazil", age: "22")
            ]
        ),
        Club(
            id: "5",
            name: "Liverpool",
            logo: "liverpool",
            league: "Premier League",
            leagueFlag: "englandFlag",
            stadium: "Anfield",
            founded: "1892",
            manager: "Jürgen Klopp",
            players: [
                Player(name: "Alisson Becker", number: "1", position: .goalkeeper, nationality: "Brazil", age: "31"),
                Player(name: "Virgil van Dijk", number: "4", position: .defender, nationality: "Netherlands", age: "32"),
                Player(name: "Mohamed Salah", number: "11", position: .forward, nationality: "Egypt", age: "31"),
                Player(name: "Darwin Núñez", number: "9", position: .forward, nationality: "Uruguay", age: "24"),
                Player(name: "Trent Alexander-Arnold", number: "66", position: .defender, nationality: "England", age: "25")
            ]
        ),
        Club(
            id: "6",
            name: "Arsenal",
            logo: "arsenal",
            league: "Premier League",
            leagueFlag: "englandFlag",
            stadium: "Emirates Stadium",
            founded: "1886",
            manager: "Mikel Arteta",
            players: [
                Player(name: "Aaron Ramsdale", number: "1", position: .goalkeeper, nationality: "England", age: "25"),
                Player(name: "William Saliba", number: "2", position: .defender, nationality: "France", age: "22"),
                Player(name: "Martin Ødegaard", number: "8", position: .midfielder, nationality: "Norway", age: "24"),
                Player(name: "Bukayo Saka", number: "7", position: .forward, nationality: "England", age: "22"),
                Player(name: "Gabriel Jesus", number: "9", position: .forward, nationality: "Brazil", age: "26")
            ]
        )
    ]
}
