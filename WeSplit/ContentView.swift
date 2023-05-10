

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 10.0
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 20
    
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 1)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        
        NavigationView {
            List {
                Text("wedlec best apps")
                
                //секция
                Section {
                    //текстовое поле для ввода
                    TextField("введите сумму чека", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)  //клава нумпад
                    
                    //выбираем пикер
                    Picker("колличесво людей", selection: $numberOfPeople) {
                        ForEach(1..<10) {
                            Text("\($0) человек")
                        }
                    }
                    
                }
                
                
                Section {
                    //пикер чаевых через массив чисел и стиля сигмент
                    Picker("чаевые", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                } header: {
                    Text("сколько чаевых вы хотите оставить?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
            header: {
                Text("итого на человека")
            }
            }
            .navigationTitle("калькулятор чаевых")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
