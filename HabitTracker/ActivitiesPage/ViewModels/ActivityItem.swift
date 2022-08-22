//
//  ActivityItem.swift
//  HabitTracker
//
//  Created by Vincent Salinas on 8/21/22.
//

import SwiftUI

struct ActivityItem: View {
    var activity: ActivityModel?
    
    var body: some View {
        VStack {
            Text(activity!.title)
        }
    }
}

struct ActivityItem_Previews: PreviewProvider {
    static var previews: some View {
        ActivityItem()
    }
}
