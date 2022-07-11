//
//  ImageRequest.swift
//  BookApi
//
//  Created by Luka Šalipur on 8.7.22..
//

import SwiftUI

struct URLImage: View{
    var urlString: String
    @State var data: Data?

    var body: some View{
        if let data = data, let uiimage = UIImage(data:data) {

            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:130, height:190)
                .background(Color.gray)
                .cornerRadius(5)
                
            
        } else {
            Image(systemName: "book").onAppear {
                fetch()
            }
        }
    }
    
    private func fetch(){
        guard let url = URL(string: urlString) else {
            return
        }
                let task = URLSession.shared.dataTask(with:url) { data, _, error in
                    self.data = data
                }
        task.resume()
    }

}

