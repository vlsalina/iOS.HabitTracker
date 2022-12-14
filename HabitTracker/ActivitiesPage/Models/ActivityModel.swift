//
//  ActivityModel.swift
//  HabitTracker
//
//  Created by Vincent Salinas on 8/21/22.
//

import Foundation

class ActivityModel: Codable, Identifiable {
    var id: UUID
    var title: String
    var description: String
    var completed: Int
    
    init(id: UUID, title: String, description: String, completed: Int) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.completed = 0
    }
    
    func incrementCompleted() {
        completed += 1
    }
    
    func decrementCompleted() {
        completed -= 1
    }
    
}
