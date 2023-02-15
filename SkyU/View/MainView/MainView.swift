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
            Text("Recent Posts")
                .tabItem {
                    Image(systemName: "rectangle.portrait.on.rectangle.portrait.angled")
                    Text("Posts")
                }
            Text("Profile View")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Profile")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
