//
//  AddNewActivityPage.swift
//  HabitTracker
//
//  Created by Vincent Salinas on 8/21/22.
//

import SwiftUI

struct AddNewActivityPage: View {
    
    @EnvironmentObject var activityPageVM: ActivityPageViewModel
    @Environment(\.dismiss) var dismiss
    @State var title = ""
    @State var description = ""
    @State var showAlert = false
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        Form {
            TextField("Enter title here", text: $title)
                .padding([.horizontal], 3)
            
            Section {
                ZStack(alignment: .topLeading) {
                    if description.isEmpty {
                        Text("Enter description here")
                            .foregroundColor(Color(UIColor.placeholderText))
                            .padding([.horizontal], 3)
                            .padding(.vertical, 12)
                    }
                    TextEditor(text: $description)
                        .frame(minHeight: 300)
                }
                .font(.body)
                
            }
            
            Section {
                Button(action: {
                    let newActivity = ActivityModel(title: title, description: description, completed: 0)
                    showAlert = activityPageVM.addNewActivity(activity: newActivity)
                    if (!showAlert) {
                        dismiss()
                    }
                }) {
                    Text("Add New Activity")
                }
                .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle("Create New Activity")
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Invalid details"),
                message: Text("Please provide a valid title and description"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct AddNewActivityPage_Previews: PreviewProvider {
    static var previews: some View {
        AddNewActivityPage()
            .environmentObject(ActivityPageViewModel())
    }
}
