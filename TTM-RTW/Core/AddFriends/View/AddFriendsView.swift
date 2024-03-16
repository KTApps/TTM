//
//  AddFriendsView.swift
//  TTM-RTW
//
//  Created by Tanaka Bere on 28/02/2024.
//

import SwiftUI

struct AddFriendsView: View {
    @State private var searchText = ""
    @StateObject var viewModel = AddFriendsViewModel()
    
    var body: some View {
        NavigationStack {
            // in a NavStack so we can click on users and open ProfileView
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user: user)
                                
                                Divider()
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("TTM")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText)
            // search bar 
        }
    }
}

struct AddFriendsView_Preciews: PreviewProvider {
    static var previews: some View {
        AddFriendsView()
    }
}
