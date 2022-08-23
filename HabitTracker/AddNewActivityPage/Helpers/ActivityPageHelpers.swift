//
//  ActivityPageHelpers.swift
//  HabitTracker
//
//  Created by Vincent Salinas on 8/22/22.
//

import Foundation

func validateActivity(activity: ActivityModel) -> Bool {
    
    guard !activity.title.isEmpty else {
        return false
    }
    
    guard !activity.description.isEmpty else {
        return false
    }
    
    return true
    
}
