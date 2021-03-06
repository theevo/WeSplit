//
//  ContentView.swift
//  WeSplit
//
//  Created by Theo Vora on 6/14/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPerentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalWithTip: Double {
        let tip = Double(tipPercentages[tipPerentage])
        let total = Double(checkAmount) ?? 0
        
        let tipAmount = total * tip / 100
        let finalTotal = total + tipAmount
        
        return finalTotal
    }
    
    var totalPerPerson: Double {
        let people = Double(numberOfPeople) ?? 1
        let perPersonTotal = totalWithTip / people
        
        return perPersonTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                    
//                    Picker("Number of people", selection: $numberOfPeople) {
//                        ForEach(2 ..< 100) {
//                            Text("\($0) people")
//                        }
//                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPerentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total with tip")) {
                    Text("$\(totalWithTip, specifier: "%.2f")")
                }
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
