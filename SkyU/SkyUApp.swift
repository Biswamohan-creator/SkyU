//
//  SkyUApp.swift
//  SkyU
//
//  Created by CHINAM DWARIKANATH PATRA on 11/01/23.
//

import SwiftUI
import Firebase

@main
struct SkyUApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
