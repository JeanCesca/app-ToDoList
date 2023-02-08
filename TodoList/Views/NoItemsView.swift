//
//  NoItemsView.swift
//  TodoList
//
//  Created by Jean Ricardo Cesca on 08/02/23.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Are you a productive person?\nI think you should start to add a bunch of items to your todo list")
                    .padding(.bottom, 20)
                NavigationLink {
                    AddView()
                } label: {
                    Text("➕")
                        .foregroundColor(.white)
                        .font(.title2)
                        .frame(minHeight: 50)
                        .frame(maxWidth: 50)
                        .background(
                            animate ? Color.red : Color.blue
                        )
                        .cornerRadius(25)
                }
                .padding(.horizontal, animate ? 50 : 55)
                .shadow(color: animate ? .red.opacity(0.5) : .blue.opacity(0.5), radius: 5, x: 0, y: 10)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -4 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 1.5)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
        }
    }
}
