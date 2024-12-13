//
// CalculatorView.swift
//  Calculator
//
//  Created by Danielle Ziac Abril on 10/8/24.
//

import SwiftUI

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case mutliply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case openParen = "("
    case closeParen = ")"

    var buttonColor: Color {
        switch self {
        case .add, .subtract, .mutliply, .divide, .equal:
            return .orange
        case .clear, .openParen, .closeParen:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}

enum Operation {
    case add, subtract, multiply, divide, none
}

struct CalculatorView: View {

    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    @State private var showSignInView = false

    let buttons: [[CalcButton]] = [
        [.clear, .openParen, .closeParen, .divide],
        [.seven, .eight, .nine, .mutliply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            GeometryReader { geometry in
                let totalWidth = geometry.size.width
                //let totalWidth: CGFloat = 390
                let spacing: CGFloat = totalWidth * 0.03
                VStack {
                    Spacer()
                    
                    // Text display
                    HStack {
                        Spacer()
                        Text(value)
                            .font(.system(size: UIScreen.main.bounds.width * 0.25))
                        //.font(.system(size: 100))
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                    // Buttons
                    ForEach(buttons, id: \.self) { row in
                        HStack(spacing: spacing) {
                            ForEach(row, id: \.self) { item in
                                Button(action: {
                                    self.didTap(button: item)
                                }, label: {
                                    Text(item.rawValue)
                                        //.font(.system(size: 32))
                                        .font(.system(size: totalWidth * 0.07))
                                        //.font(.system(size: min(UIScreen.main.bounds.width * 0.25, 80)))

                                        .frame(
                                            width: self.buttonWidth(item: item, totalWidth: geometry.size.width),
                                            height: self.buttonHeight(totalWidth: geometry.size.width)
                                        )
                                        .background(item.buttonColor)
                                        .foregroundColor(.white)
                                        .cornerRadius(self.buttonWidth(item: item, totalWidth: geometry.size.width) / 2)
                                })
                            }
                        }
                        .padding(.bottom, 3)
                    }
                }
                //.navigationTitle("Calculator")
                .navigationBarItems(
                trailing: NavigationLink(
                    destination: SettingsView(showSignInView: $showSignInView)) {
                        Image(systemName: "gear")
                        .imageScale(.large)
                        })
                    .padding(.top, 10)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Calculator")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                        }
                    }
//                    .padding(.top, geometry.safeAreaInsets.top)
//                        .padding(.bottom, geometry.safeAreaInsets.bottom)
//                        .edgesIgnoringSafeArea(.all)
                }
            }
        }
    //}

    func didTap(button: CalcButton) {
        switch button {
        case .add, .subtract, .mutliply, .divide, .equal:
            if button == .add {
                self.currentOperation = .add
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .subtract {
                self.currentOperation = .subtract
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .mutliply {
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .divide {
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation {
                case .add: self.value = "\(runningValue + currentValue)"
                case .subtract: self.value = "\(runningValue - currentValue)"
                case .multiply: self.value = "\(runningValue * currentValue)"
                case .divide:
                    if currentValue == 0 {
                        self.value = "Error"  // Division by zero error
                    } else {
                        self.value = "\(runningValue / currentValue)"
                    }
                case .none:
                    break
                }
            }

            if button != .equal {
                self.value = "0"
            }
        case .clear:
            self.value = "0"
        case .decimal, .openParen, .closeParen:
            break
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
        }
    }

    func buttonWidth(item: CalcButton, totalWidth: CGFloat) -> CGFloat {
        if item == .zero {
            return ((totalWidth - (4*12)) / 4) * 2
        }
        return (totalWidth - (5*12)) / 4
    }
//    func buttonWidth(item: CalcButton, totalWidth: CGFloat) -> CGFloat {
//            let baseWidth = (totalWidth - (5 * (totalWidth * 0.02))) / 4 // Smaller spacing
//            return item == .zero ? (baseWidth * 2 + (totalWidth * 0.02)) : baseWidth
//        }


    func buttonHeight(totalWidth:CGFloat) -> CGFloat {
        return (totalWidth - (5*12)) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
        .previewDevice("iPhone 14")
    }
}
