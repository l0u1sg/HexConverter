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
            BinaryConverter().tabItem { Image(systemName: "2.square.fill") ; Text("menu.conversion.binary") }.tag(0)
            HexaConverter().tabItem { Image(systemName: "16.square.fill") ; Text("menu.conversion.hexa") }.tag(1)
            AnyBaseConverter().tabItem { Image(systemName: "number.square.fill") ; Text("Any base") }.tag(2)
            
        })
    }
}

#Preview {
    ContentView()
}
