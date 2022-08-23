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
    
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddNewActivityPage().environmentObject(activityPageVM), isActive: $showNextView) {
                    EmptyView()
                }
                ScrollView {
                    LazyVStack {
                        ForEach(activityPageVM.activities) { activity in
                            ActivityItem(activity: activity)
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
