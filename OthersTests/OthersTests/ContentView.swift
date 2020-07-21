//
//  ContentView.swift
//  OthersTests
//
//  Created by Tristan Clet on 21/07/2020.
//  Copyright © 2020 Tristan Clet. All rights reserved.
//

import SwiftUI

let names = ["Tristan","Maxence","Louise","Anne","Heloïse","Clara"]
let ages = [23,20,22,25,21,22]

struct ContentView: View {
    @State private var rowsCount = 3
    @State private var colsCount = 2
    var body: some View {
        GridStack(rows: self.rowsCount, columns: self.colsCount) { row, col in
            guy(name: names[row*self.colsCount+col], age: ages[row*self.colsCount+col])
        }
    }
}


struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
    VStack {
        ForEach(0..<rows, id: \.self) { row in
            HStack {
                ForEach(0..<self.columns, id: \.self) { column in
                    self.content(row, column)
                    }
                }
            }.padding(10)
        }
    }
}

struct guy: View {
    let name: String
    let age: Int
    
    var body: some View {
        HStack {
            Spacer()
            Text(name)
            Spacer()
            Text("\(age)yo")
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
