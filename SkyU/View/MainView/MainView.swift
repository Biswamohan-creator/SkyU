//
//  MainView.swift
//  SkyU
//
//  Created by CHINAM DWARIKANATH PATRA on 14/02/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        // MARK: TabView with recent posts and profile tabs
        TabView {
            PostsView()
                .tabItem {
                    Image(systemName: "rectangle.portrait.on.rectangle.portrait.angled")
                    Text("Posts")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Profile")
                }
        }
        // Changing tab label tint to black
        .tint(.black)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
