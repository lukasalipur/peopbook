//
//  ContentView.swift
//  BookApi
//
//  Created by Luka Šalipur on 7.6.22..
//

import SwiftUI





// ContentView
struct ContentView: View {

    
        var body: some View {
            if  UserDefaults.standard.welcomeScreenShown
            {
                HomeScreen()
            } else {
                WelcomeScreen()
            }
     
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
