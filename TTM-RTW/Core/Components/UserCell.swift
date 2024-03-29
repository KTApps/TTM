//
//  UserCell.swift
//  TTM-RTW
//
//  Created by Tanaka Bere on 28/02/2024.
//

import SwiftUI

struct UserCell: View {
    let user: User
    @State var AddFriend = false
    
    // what you see of other users
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .small)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(user.username)
                    .fontWeight(.semibold)
                
                Text(user.fullname)
            }
            .font(.footnote)
            
            Spacer()
            
            HStack {
                Button(action: {
                    AddFriend.toggle()
                    print(AddFriend)
                }) {
                    Text(AddFriend ? "Added" : "Add friend")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .frame(width: 100, height: 32)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(.systemGray4), lineWidth: 1)
                        }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: dev.user)
    }
}
