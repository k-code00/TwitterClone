//
//  SideMenuView.swift
//  Q
//
//  Created by Consultant on 20/10/2023.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        if let user = AuthViewModel.shared.user {
            VStack {
                SideMenuHeaderView(show: $isShowing)
                    .frame(height: 200)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(SideMenuViewModel.allCases, id: \.self) { option in
                            if option == .profile {
                                NavigationLink(
                                    destination: LazyView(UserProfileView(user: user)),
                                    label: {
                                        SideMenuOptionView(option: option)
                                    })
                                .frame(height: 40)
                                .padding()
                            } else if option == .logout {
                                Button(action: { AuthViewModel.shared.signOut() }) {
                                    SideMenuOptionView(option: option)
                                        .frame(height: 40)
                                        .padding()
                                }
                            }
                        }
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }
}
