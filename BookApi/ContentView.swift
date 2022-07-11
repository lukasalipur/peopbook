//
//  ContentView.swift
//  BookApi
//
//  Created by Luka Šalipur on 7.6.22..
//

import SwiftUI





// ContentView
struct ContentView: View {
    @StateObject var network = Network()
    private var twoColumnsGrid = [GridItem(.flexible(), spacing:-70), GridItem(.flexible(), spacing:-70)]
    @State private var showToolbar = false
    @State private var fadeInOut = false
   
        var body: some View {
            ZStack{
            NavigationView{
            VStack(spacing:25){
            Background()
                .fill(CustomColor.backgroundColor)
                .frame(width:.infinity, height:300)
                .shadow(color: .black, radius: 5, x:0, y:5)
                .overlay(
                        VStack{
                        ZStack(alignment: .topTrailing){
                            Color.clear
                            Text("PEOPBOOK.")
                        .kerning(-3)
                        .font(.custom(FontManager.SourceSans3.black, size:41))
                        .padding(.bottom, 30.0)
                        .offset(x:-10, y:35)
                        .foregroundColor(Color.white)
             
                    }
                            
                        ZStack{
                            Rectangle()
                                .foregroundColor(.white).opacity(0.3)
                            HStack {
                                Image(systemName: "magnifyingglass")
                                TextField("Search ..", text: $network.query)
                             }
                             .foregroundColor(.white)
                             .padding(.leading, 13)
                            }.frame(height: 40)
                             .cornerRadius(13)
                             .padding(10)
                             .opacity(showToolbar ? 1 : 0)

                        ZStack(alignment: .leading){
                            Color.clear
                            Text("Welcome, relax your brain while reading favourite books.").frame(width:180).offset(x:5).font(.custom(FontManager.Inter.regular, size:17)).foregroundColor(Color.white)
                                .onAppear(){
                                    withAnimation(Animation.easeInOut(duration: 1)) {
                                        fadeInOut = true
                                    }
                                }
                                .opacity(fadeInOut ? 1 : 0)
                        }
                            ZStack{
                                Button(){
                                    withAnimation{
                                    showToolbar = true
                                    }
                                }
                            label: {
                                Image(systemName: "magnifyingglass.circle.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size:showToolbar ? 0 : 50))
                                
                            }.zIndex(0)
                         }
                      }
                )
        
                Spacer()

                ScrollView{
                    VStack{
                        Text("Results")
                            .font(.system(size:17))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .frame(width: 300, alignment: .leading)
                            .padding(15)
                            
                    VStack(spacing:10){
                        LazyVGrid(columns:twoColumnsGrid, spacing:17){
                        ForEach(network.book, id:\.self) { item in
                            
                NavigationLink{
                    Webview(url: URL(string: "\(item.volumeInfo.previewLink)")!)
                    
                } label: {
            
                            URLImage(urlString:item.volumeInfo.imageLinks.thumbnail)
                            .padding(.bottom, 20.0)
                            .cornerRadius(5)
                            .shadow(color: Color.black.opacity(0.7), radius: 10, x: 10, y: 5)
                                
                                }
                            }
                        }
                    }
                }
            }
        }
            .edgesIgnoringSafeArea(.all)
            }
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
