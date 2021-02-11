//
//  TramStop.swift
//  Home Time
//
//  Created by Jason van Lint on 8/2/21.
//

import Foundation

struct TramStop {
    let line: Int
    let stop: Int
    let timetable: [Date]
    
    internal init(line: Int, stop: Int, timetable: [Date]) {
        self.line = line
        self.stop = stop
        self.timetable = timetable
    }




}
