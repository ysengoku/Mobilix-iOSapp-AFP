//
//  ContentView.swift
//  Mobilix
//
//  Created by Werner Mona on 03/05/2023.
//

import SwiftUI

struct ContentView: View {
    init() {
       // UITabBar.appearance().isTranslucent = false
        let standarApparence = UITabBarAppearance()
            standarApparence.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = standarApparence
        let scrollEdgeAppareance = UITabBarAppearance()
        scrollEdgeAppareance.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = scrollEdgeAppareance
        
    }
    
    
    var body: some View {
//        VStack {
            TabView{
                MapView()
                    .tabItem{
                        Label("Carte", systemImage: "map.fill" )
                    }
                
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person.fill" )
                    }
                ListRewardsView()
                    .tabItem{
                        Label("Recompenses", systemImage: "gift.fill" )
                    }
            
             }
            .accentColor(Color("darkGreen"))
//            .onAppear(){
//                UITabBar.appearance().barTintColor = .white
            
            .onAppear () {
//                let tabBarAppearance = UITabBarAppearance()
//                tabBarAppearance.configureWithDefaultBackground()
                
                
            }
        
       // }
    }
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           // .environment(\.locale, .init(identifier: "FR"))
    }
}
