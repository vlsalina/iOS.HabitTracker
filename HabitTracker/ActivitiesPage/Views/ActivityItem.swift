//
//  ActivityItem.swift
//  HabitTracker
//
//  Created by Vincent Salinas on 8/21/22.
//

import SwiftUI

struct ActivityItem: View {
    @EnvironmentObject var activityPageVM: ActivityPageViewModel
    var activity: ActivityModel?
    
    var body: some View {
        VStack {
            HStack {
                Text(activity!.title)
                Spacer()
                Button(action: {
                    activityPageVM.deleteActivity(id: activity!.id)
                }) {
                    Image(systemName: "minus.circle.fill")
                }
            }
        }
        .padding([.bottom], 5)
    }
}

struct ActivityItem_Previews: PreviewProvider {
    static var previews: some View {
        ActivityItem()
            .environmentObject(ActivityPageViewModel())
    }
}
