//
//  LiveMatch+CoreDataProperties.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 14.09.25.
//
//

import Foundation
import CoreData

extension LiveMatch {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LiveMatch> {
        return NSFetchRequest<LiveMatch>(entityName: "LiveMatch")
    }

    @NSManaged public var matchID: String?
    @NSManaged public var leauge: String?
    @NSManaged public var leagueFlag: String?
    @NSManaged public var homeTeam: String?
    @NSManaged public var matchTime: String?
    @NSManaged public var homeLogo: String?
    @NSManaged public var awayTeam: String?
    @NSManaged public var awayLogo: String?
    @NSManaged public var homeScore: Int16
    @NSManaged public var awayScore: Int16
    @NSManaged public var status: String?
    @NSManaged public var minute: String?
    @NSManaged public var priority: Int16
    @NSManaged public var lastUpdated: Date?
}

extension LiveMatch : Identifiable {

}
