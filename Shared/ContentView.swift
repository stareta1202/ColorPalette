//
//  ContentView.swift
//  Shared
//
//  Created by yjlee12 on 2021/12/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("main")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("search")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView: View {
    @ObservedObject var core = MainCore()
    var body: some View {
        NavigationView {
            VStack {

                TextField("text", text: $core.text)
                    .cornerRadius(6)
                    .frame(height: 32, alignment: .center)
                    .foregroundColor(.red)
                    .background(Color.secondary)
                    .opacity(0.3)
                    .padding(16)
                    
                Spacer()
                Text("Hello, world!")
                    .padding()
                Text("ewew")
                    .padding()
            }
        }
    }
}

class MainCore: ObservableObject {
    @Published var text: String = ""
    private var subscription = Set<AnyCancellable>()
    
    init() {
        bind()
    }
    
    func bind () {
        print("!1")
        $text.sink { text in
            print("text \(text)")
        }
        .store(in: &subscription)
    }
    
}
