//
//  ActivitiesPage.swift
//  HabitTracker
//
//  Created by Vincent Salinas on 8/21/22.
//

import SwiftUI

struct ActivitiesPage: View {
    @StateObject var activityPageVM = ActivityPageViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(activityPageVM.activities) { activity in
                            ActivityItem(activity: activity)
                        }
                    }
                }
            }
            .navigationTitle("Activities")
        }
    }
}

struct ActivitiesPage_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesPage()
    }
}
