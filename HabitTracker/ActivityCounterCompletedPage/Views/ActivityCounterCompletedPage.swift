//
//  ActivityCounterCompletedPage.swift
//  HabitTracker
//
//  Created by Vincent Salinas on 8/22/22.
//

import SwiftUI

struct ActivityCounterCompletedPage: View {
    @EnvironmentObject var activityPageVM: ActivityPageViewModel
    @State var completed = 0
    
    var activity: ActivityModel?
    
    let size = 50
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Section {
                    HStack {
                        Text(activity!.description)
                        Spacer()
                    }
                }
                
                Section {
                    HStack {
                        Text("Completed: \(completed >= 0 ? completed : 0)")
                        Spacer()
                    }
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    Spacer()
                    Button(action: {
                        completed += 1
                        activityPageVM.incrementCounter(id: activity!.id)
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: CGFloat(size), height: CGFloat(size))
                            .scaledToFill()
                    }
                    Spacer()
                    Button(action: {
                        completed -= 1
                        activityPageVM.decrementCounter(id: activity!.id)
                    }) {
                        Image(systemName: "minus.circle.fill")
                            .resizable()
                            .frame(width: CGFloat(size), height: CGFloat(size))
                            .scaledToFill()
                    }
                    Spacer()
                }
            }
        }
        .padding()
        .navigationTitle(activity!.title)
        .onAppear() {
            completed = activity!.completed
        }
    }
}

struct ActivityCounterCompletedPage_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCounterCompletedPage()
            .environmentObject(ActivityPageViewModel())
    }
}
