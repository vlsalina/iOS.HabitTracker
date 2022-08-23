//
//  ActivityPageViewModel.swift
//  HabitTracker
//
//  Created by Vincent Salinas on 8/21/22.
//

import Foundation

class ActivityPageViewModel: ObservableObject {
    @Published private(set) var activities = [ActivityModel]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "activities")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "activities") {
            if let decoded = try? JSONDecoder().decode([ActivityModel].self, from: data) {
                activities = decoded
            }
        }
    }
    
    func incrementCounter(id: UUID) {
        if let activity = activities.first(where: { $0.id == id }) {
            activity.completed += 1
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "activities")
            }
        }
    }
    
    func decrementCounter(id: UUID) {
        if let activity = activities.first(where: { $0.id == id }) {
            if ((activity.completed - 1) >= 0) {
                activity.completed -= 1
                if let encoded = try? JSONEncoder().encode(activities) {
                    UserDefaults.standard.set(encoded, forKey: "activities")
                }
            }
        }
    }
    
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
