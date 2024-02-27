//
//  TTMTabView.swift
//  TTM-RTW
//
//  Created by Tanaka Bere on 27/02/2024.
//

import SwiftUI

struct TTMTabView: View {
    @State private var selectedTab = 0
    @State private var showNewPostView = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // selection parameter keeps track of which tabview is selected
            FeedView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                    // if selected tab = 0 house.fill, if no then house
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            NewPostView()
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
            
            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 2 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                }
                .onAppear { selectedTab = 2 }
                .tag(2)
        }
        .onChange(of: selectedTab, perform: { newValue in
            showNewPostView = selectedTab == 1
        })
        .sheet(isPresented: $showNewPostView, onDismiss: {
            selectedTab = 0
        }, content: {
            NewPostView()
        })
        .tint(.black)
    }
}

struct TTMTabView_Preciews: PreviewProvider {
    static var previews: some View {
        TTMTabView()
    }
}
