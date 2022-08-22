//
//  AddNewActivityPage.swift
//  HabitTracker
//
//  Created by Vincent Salinas on 8/21/22.
//

import SwiftUI

struct AddNewActivityPage: View {
    @State var title = ""
    @State var description = ""
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        Form {
            TextField("Enter title here", text: $title)
            
            Section {
                ZStack(alignment: .topLeading) {
                    if description.isEmpty {
                        Text("Enter description here")
                            .foregroundColor(Color(UIColor.placeholderText))
                            .padding(.vertical, 12)
                    }
                    TextEditor(text: $description)
                        .frame(minHeight: 300)
                }
                .font(.body)
            }
        }
        .navigationTitle("Create New Activity")
    }
}

struct AddNewActivityPage_Previews: PreviewProvider {
    static var previews: some View {
        AddNewActivityPage()
    }
}
