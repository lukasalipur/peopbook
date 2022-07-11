//
//  WelcomeScreen.swift
//  BookApi
//
//  Created by Luka Šalipur on 11.7.22..
//

import SwiftUI



extension UserDefaults {
    var welcomeScreenShown: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "welcomeScreenShown") as? Bool) ?? false
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: "welcomeScreenShown")
        }
    }
}

struct WelcomeScreen: View {
    @AppStorage("welcomeScreenShown")
    var welcomeScreenShown:Bool = false
    var body: some View {
        NavigationView{
    VStack{
        VStack{
            Group{
            
            Text("Welcome to")
                .font(.system(size:45))
                .fontWeight(.heavy)
                
            Text("Peopbook.")
                .font(.system(size:45))
                .fontWeight(.heavy)
                .foregroundColor(Color("Background"))

                Text("Discover new books everyday.")
                    .font(.system(size:20))
                    .padding(.top, -20)
                
                    
    
            Spacer()
            }.frame(width: 350, alignment: .leading)
        }.padding(.top, 30)
        
        Image(systemName: "books.vertical.fill").font(.system(size:300))
            .foregroundColor(Color.orange)
            .offset(x:-0, y:-70)
        
        NavigationLink{
        HomeScreen()
        }label:{
        Image(systemName: "arrow.right.circle.fill")
            .font(.system(size:70))
                .foregroundColor(Color.orange)
               
            } .frame(width: 350, height: .infinity, alignment: .trailing)

    }.onAppear(){
        UserDefaults.standard.welcomeScreenShown = true
    }
    }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
