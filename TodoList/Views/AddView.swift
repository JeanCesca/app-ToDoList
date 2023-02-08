//
//  AddView.swift
//  TodoList
//
//  Created by Jean Ricardo Cesca on 08/02/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(
                        Color.gray.opacity(0.2)
                    )
                .cornerRadius(20)
                
                Button {
                    saveButton(title: textFieldText)
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(20)
                }
                .padding(.vertical)

            }
            .padding()
        }
        .navigationTitle("Add an item 🖋️")
        .alert(alertTitle, isPresented: $showAlert) {
            
        }
    }
    
    func saveButton(title: String) {
        if isTextValid(text: title) {
            listViewModel.addItem(title: title)
            dismiss()
        } else {
            
        }
    }
    
    func isTextValid(text: String) -> Bool {
        if text.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long. 💅"
            showAlert.toggle()
            return false
        } else {
            return true
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
