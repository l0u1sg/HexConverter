//
//  ContentView.swift
//  BinaryConverter
//
//  Created by Louis Gallet on 04/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab,
                content:  {
            BinaryConverter().tabItem { Image(systemName: "1.square.fill") ; Text("Binary") }.tag(0)
            HexaConverter().tabItem { Image(systemName: "2.square.fill") ; Text("Hexa") }.tag(1)
            
        })
    }
}

#Preview {
    ContentView()
}
