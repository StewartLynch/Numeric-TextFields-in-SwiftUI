//
// Created for NumericTextFieldds
// by Stewart Lynch on 2022-12-18
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Follow me om Mastodon: @StewartLynch@iosDev.space
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct ContentView: View {
    enum FocusedField {
        case int, dec
    }
    @State private var intNumberString = ""
    @State private var decNumberString = ""
    @FocusState private var focusedField: FocusedField?
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter Integer Number", text: $intNumberString)
                    .focused($focusedField, equals: .int)
                    .numbersOnly($intNumberString)
                TextField("Enter Decimal Number", text: $decNumberString)
                    .focused($focusedField, equals: .dec)
                    .numbersOnly($decNumberString, includeDecimal: true)
                Spacer()
            }
            .navigationTitle("Numbers Only")
            .textFieldStyle(.roundedBorder)
            .frame(width: 200)
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Spacer()
                }
                ToolbarItem(placement: .keyboard) {
                    Button {
                        focusedField = nil
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                }
            }
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
