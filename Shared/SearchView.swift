//
//  SearchView.swift
//  Palette
//
//  Created by yjlee12 on 2021/12/26.
//

import Foundation
import SwiftUI
struct SearchView: View {
    @ObservedObject var core = SearchCore()
    var body: some View {
        NavigationView {
            TextField("text", text: $core.text)
                .foregroundColor(.red)
                .padding()
            Text("Hello, world!")
                .padding()
            Text("ewew")
                .padding()   
        }
    }
}

class SearchCore: ObservableObject {
    @Published var text: String = ""

    
}
