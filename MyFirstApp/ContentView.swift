//
//  ContentView.swift
//  MyFirstApp
//
//  Created by Emil Poppler on 2022-12-22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoggedIn = LocalStorage.loggedIn
    
    var body: some View {
        return Group {
            if isLoggedIn {
                MainView()
            }
            else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}


struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Start")
                }
            OrdersView()
                .tabItem {
                    Image(systemName: "box.truck.fill")
                    Text("Ordrar")
                }
            ProductsView()
                .tabItem {
                    Image(systemName: "tshirt.fill")
                    Text("Produkter")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.2.fill")
                    Text("Inställningar")
                }
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Sales this week")
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 200, alignment: .topLeading)
                .padding(20)
                
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .navigationTitle("Start")
        }
    }
}

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    LocalStorage.loggedIn = false
                }) {
                    Text("Logout")
                }
                
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .navigationTitle("Inställningar")
        }
    }
}

struct OrdersView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .navigationTitle("Ordrar")
        }
    }
}

struct ProductsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .navigationTitle("Produkter")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
