//
//  TeamsSection.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 9/3/25.
//
import UIKit

struct MatchRow {
    let dateWeekDay: String
    let time: String
    let timeZone: String
    let homeCity: String
    let sportsClub: String
}

struct TeamsSection {
    let cityName: String
    let cityImage: String
    let relativeTime: String
    var matches: [MatchRow]
    
    static func sampleData() -> [TeamsSection] {
        return [
            TeamsSection(
                cityName: "Valencia",
                cityImage: "flag8",
                relativeTime: "Tomorrow",
                matches: [
                    MatchRow(
                        dateWeekDay: "SAT",
                        time: "6:30",
                        timeZone: "PM",
                        homeCity: "Valencia",
                        sportsClub: "Girona"
                    ),
                    MatchRow(
                        dateWeekDay: "WED",
                        time: "6:55",
                        timeZone: "PM",
                        homeCity: "Valencia",
                        sportsClub: "BSC Young Boys"
                    )
                ]
            ),
            TeamsSection(
                cityName: "Chelsea", cityImage: "flag9", relativeTime: "In 2 days", matches: [
                    MatchRow(
                        dateWeekDay: "FRI",
                        time: "2:30",
                        timeZone: "PM",
                        homeCity: "Chelsea",
                        sportsClub: "Derby County"
                    )
                ]
            )
        ]
    }
}
