//
//  ActivitiesPage.swift
//  HabitTracker
//
//  Created by Vincent Salinas on 8/21/22.
//

import SwiftUI

struct ActivitiesPage: View {
    @StateObject var activityPageVM = ActivityPageViewModel()
    @State var showNextView = false
    @State var showDetails = false
    @State var current: ActivityModel?
    
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddNewActivityPage().environmentObject(activityPageVM), isActive: $showNextView) {
                    EmptyView()
                }
                NavigationLink(destination: ActivityCounterCompletedPage(activity: current).environmentObject(activityPageVM), isActive: $showDetails) {
                    EmptyView()
                }
                ScrollView {
                    LazyVStack {
                        ForEach(activityPageVM.activities) { activity in
                            Button(action: {
                                current = activity
                                showDetails = true
                            }) {
                                ActivityItem(activity: activity)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("Activities")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        showNextView = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
            )
        }
    }
}

struct ActivitiesPage_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesPage()
    }
}