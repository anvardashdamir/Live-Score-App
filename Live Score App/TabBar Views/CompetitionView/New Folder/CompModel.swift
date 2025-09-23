//
//  Model.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 18.09.25.
//

import UIKit

struct CompModel {
    let countryName: String
    let leagueName: String
    let countryFlag: String
}


let countries: [CompModel] = [
    CompModel(countryName: "Europe", leagueName: "Champions Leauge", countryFlag: "europaFlag"),
    CompModel(countryName: "Europe", leagueName: "Europa Leauge", countryFlag: "europaFlag"),
    CompModel(countryName: "England", leagueName: "Premier League", countryFlag: "englandFlag"),
    CompModel(countryName: "Spain", leagueName: "La Liga", countryFlag: "spainFlag"),
    CompModel(countryName: "Germany", leagueName: "Bundesliga", countryFlag: "germanFlag"),
    CompModel(countryName: "Italy", leagueName: "Seria A", countryFlag: "italyFlag"),
    CompModel(countryName: "France", leagueName: "Ligue 1", countryFlag: "franceFlag")
    ]
