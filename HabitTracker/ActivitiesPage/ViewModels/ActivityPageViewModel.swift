//
//  ActivityPageViewModel.swift
//  HabitTracker
//
//  Created by Vincent Salinas on 8/21/22.
//

import Foundation

class ActivityPageViewModel: ObservableObject {
    @Published private(set) var activities = [ActivityModel]()
    
    func addNewActivity(activity: ActivityModel) -> Bool {
        if (validateActivity(activity: activity)) {
            activities.append(activity)
            return false
        }
        
        return true
    }
    
    func testData() {
        activities = [
            ActivityModel(title: "title", description: "description", completed: 0),
            ActivityModel(title: "title", description: "description", completed: 0),
            ActivityModel(title: "title", description: "description", completed: 0),
            ActivityModel(title: "title", description: "description", completed: 0),
        ]
    }
}
