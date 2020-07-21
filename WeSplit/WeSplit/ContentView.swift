//
//  ContentView.swift
//  WeSplit
//
//  Created by Tristan Clet on 07/07/2020.
//  Copyright © 2020 Tristan Clet. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: String = ""
    @State private var numberOfPeople: String = ""
    @State private var tipPercentage = 1
    
    let tipPercentages = [10, 15, 20, 25]
    
    var total: Double {
        let orderTip = Double(tipPercentages[tipPercentage])/100
        let orderAmount = Double(checkAmount) ?? 0
        let orderTotal = orderAmount*(1+orderTip)
        
        return orderTotal
    }
    
    var totalPerPerson: Double {
        let orderPeople = Double(numberOfPeople) ?? 2
        let amountPerPerson = total/orderPeople
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)

                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) { percent in
                            Text("\(self.tipPercentages[percent])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total order")) {
                    Text("\(total, specifier: "%.2f") €")
                }
                
                Section(header: Text("Amount per person")) {
                    Text("\(totalPerPerson, specifier: "%.2f") €")
                }
            }.navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
