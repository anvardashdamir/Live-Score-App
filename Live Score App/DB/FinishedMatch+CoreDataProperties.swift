//
//  FinishedMatch+CoreDataProperties.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 14.09.25.
//
//

import Foundation
import CoreData


extension FinishedMatch {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FinishedMatch> {
        return NSFetchRequest<FinishedMatch>(entityName: "FinishedMatch")
    }

    @NSManaged public var matchID: String?
    @NSManaged public var league: String?
    @NSManaged public var leagueFlag: String?
    @NSManaged public var homeTeam: String?
    @NSManaged public var homeLogo: String?
    @NSManaged public var awayTeam: String?
    @NSManaged public var awayLogo: String?
    @NSManaged public var homeScore: Int16
    @NSManaged public var awayScore: Int16
    @NSManaged public var matchDate: Date?
    @NSManaged public var groupKey: String?
    @NSManaged public var lastUpdated: Date?

}

extension FinishedMatch : Identifiable {

}
