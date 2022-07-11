//
//  Network.swift
//  BookApi
//
//  Created by Luka Šalipur on 7.6.22..
//

import Foundation
import SwiftUI
import Combine



class Network: ObservableObject{
    @Published var book = [Items]()
    
    @Published var query = "heaven"
       
       private var subscriptions = Set<AnyCancellable>()
       
       init() {
           searchPublisher
               .sink { completion in
                   print(completion) // show the error to the user
               } receiveValue: { [weak self] books in
                   self?.book = books.items
               }
               .store(in: &subscriptions)

       }
       
       var searchPublisher : AnyPublisher<Books,Error> {
           return $query
               .removeDuplicates()
               .debounce(for: 0.3, scheduler: RunLoop.main)
               .compactMap{ query -> URL? in
                   guard !query.isEmpty else { return nil }
                   guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=\(query)&key=AIzaSyB8UKyLnEkBeUZ7VCtatuiCS7jACmeNuG0") else {
                       return nil
                   }
                   return url
               }
               .flatMap { url -> AnyPublisher<Data, URLError> in
                   return URLSession.shared.dataTaskPublisher(for: url)
                       .map(\.data)
                       .eraseToAnyPublisher()
               }
               .decode(type: Books.self, decoder: JSONDecoder())
               .receive(on: DispatchQueue.main)
               .eraseToAnyPublisher()
       }
   
}
