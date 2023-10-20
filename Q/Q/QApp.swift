//
//  QApp.swift
//  Q
//
//  Created by Consultant on 19/10/2023.
//

import SwiftUI
import Firebase

@main
struct QApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
