//
//  ContentView.swift
//  OthersTests
//
//  Created by Tristan Clet on 21/07/2020.
//  Copyright © 2020 Tristan Clet. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            randomCardGuy(name: "Tristan", age: 23)
            randomCardGuy(name: "Maxence", age: 20)
        }
    }
}

struct randomCardGuy: View {
    let name: String
    let age: Int
    
    var body: some View {
        HStack {
            Spacer()
            Text(name)
            Spacer()
            Text("\(age) ans")
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
