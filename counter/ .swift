//
//  ViewController.swift
//  counter
//
//  Created by Damir Chalkarov on 10.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    enum Element: Int {
        case ac = 0
        case plusMinus = 1
        case percent = 2
        case divide = 3
        case seven = 4
        case eight = 5
        case nine = 6
        case multiply = 7
        case four = 8
        case five = 9
        case six = 10
        case minus = 11
        case one = 12
        case two = 13
        case three = 14
        case plus = 15
        case zero = 16
        case dot = 17
        case equal = 18
    
    
    var text: String {
        switch self {
        case .ac:
            return "AC"
        case .plusMinus:
            return "±"
        case .percent:
            return "%"
        case .divide:
            return "÷"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .multiply:
            return "×"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .minus:
            return "-"
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .plus:
            return "+"
        case .zero:
            return "0"
        case .dot:
            return "."
        case .equal:
            return "="
        }
    }
    }
    
    var resultLabel = UILabel()
    var firstLine: [Element] = [.ac, .plusMinus, .percent, .divide]
    var secondLine: [Element] = [.seven, .eight, .nine, .multiply]
    var thirdLine: [Element] = [.four, .five, .six, .minus]
    var fourthLine: [Element] = [.one, .two, .three, .plus]
    var fifthLine: [Element] = [.dot, .equal]
    var fifthLine1: [Element] = [.zero]
    var stillTyping = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    var dotIsPlaced = false
    var currentInput: Double {
        get {
            return Double(resultLabel.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                resultLabel.text = "\(valueArray[0])"
            } else {
                resultLabel.text = "\(newValue)"
            }
            stillTyping = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(resultLabel)
        resultLabel.text = "0"
        resultLabel.textColor = UIColor.black
        resultLabel.textAlignment = .right
        resultLabel.font = .systemFont(ofSize: 80)
        resultLabel.numberOfLines = 1
        resultLabel.adjustsFontSizeToFitWidth = true
        resultLabel.minimumScaleFactor = 0.2
        
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 190),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        let stackView1 = UIStackView(arrangedSubviews: firstLine.map {makeButton(with: $0)})
        stackView1.spacing = 6
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.distribution = .fillEqually
        view.addSubview(stackView1)
        
        NSLayoutConstraint.activate([
            stackView1.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 10),
            stackView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

       
        let stackView2 = UIStackView(arrangedSubviews: secondLine.map { makeButton(with: $0) })
        stackView2.spacing = 6
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.distribution = .fillEqually
        view.addSubview(stackView2)
        
        NSLayoutConstraint.activate([
            stackView2.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 10),
            stackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        let stackView3 = UIStackView(arrangedSubviews: thirdLine.map { makeButton(with: $0) })
        stackView3.spacing = 6
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        stackView3.distribution = .fillEqually
        view.addSubview(stackView3)
        
        NSLayoutConstraint.activate([
            stackView3.topAnchor.constraint(equalTo: stackView2.bottomAnchor, constant: 10),
            stackView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        let stackView4 = UIStackView(arrangedSubviews: fourthLine.map { makeButton(with: $0) })
        stackView4.spacing = 6
        stackView4.translatesAutoresizingMaskIntoConstraints = false
        stackView4.distribution = .fillEqually
        view.addSubview(stackView4)
        
        NSLayoutConstraint.activate([
            stackView4.topAnchor.constraint(equalTo: stackView3.bottomAnchor, constant: 10),
            stackView4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        let stackView5 = UIStackView(arrangedSubviews: fifthLine.map { makeButton(with: $0) })
        stackView5.spacing = 6
        stackView5.translatesAutoresizingMaskIntoConstraints = false
        stackView5.distribution = .fillEqually
        view.addSubview(stackView5)
        
        NSLayoutConstraint.activate([
            stackView5.topAnchor.constraint(equalTo: stackView4.bottomAnchor, constant: 10),
            stackView5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 195),
            stackView5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView5.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
        
        let stackView6 = UIStackView(arrangedSubviews: fifthLine1.map { makeButton(with: $0) })
        stackView6.spacing = 6
        stackView6.translatesAutoresizingMaskIntoConstraints = false
        stackView6.distribution = .fillEqually
        view.addSubview(stackView6)
        
        NSLayoutConstraint.activate([
            stackView6.topAnchor.constraint(equalTo: stackView4.bottomAnchor, constant: 10),
            stackView6.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView6.trailingAnchor.constraint(equalTo: stackView5.trailingAnchor, constant: -180),
            stackView6.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    
    func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
    
    func makeButton(with element: Element) -> UIButton {
        let button = UIButton()
        button.tag = element.rawValue
        button.setTitle("\(element.text)", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
    
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .lightGray
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 80)
        ])
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(numberPressed(sender:)), for: .touchUpInside)
        return button
    }
    
    @objc func numberPressed(sender: UIButton) {
        
        switch sender.tag {
        case 0:
            firstOperand = 0
            secondOperand = 0
            currentInput = 0
            resultLabel.text = "0"
            operationSign = ""
            dotIsPlaced = false
            stillTyping = false
        case 1:
            currentInput = -currentInput
        case 2:
            if firstOperand == 0 {
                currentInput = currentInput / 100
            } else {
                secondOperand = firstOperand * currentInput / 100
            }
        case 3:
            operationSign = sender.currentTitle!
            firstOperand = currentInput
            stillTyping = false
        case 4:
            let number = sender.currentTitle!
             if stillTyping {
                 if (resultLabel.text?.count)! < 20 {
                     resultLabel.text = resultLabel.text! + number
                 }
             } else {
                 resultLabel.text = number
                 stillTyping = true
             }
        case 5:
            let number = sender.currentTitle!
             if stillTyping {
                 if (resultLabel.text?.count)! < 20 {
                     resultLabel.text = resultLabel.text! + number
                 }
             } else {
                 resultLabel.text = number
                 stillTyping = true
             }
        case 6:
            let number = sender.currentTitle!
             if stillTyping {
                 if (resultLabel.text?.count)! < 20 {
                     resultLabel.text = resultLabel.text! + number
                 }
             } else {
                 resultLabel.text = number
                 stillTyping = true
             }
        case 7:
            operationSign = sender.currentTitle!
            firstOperand = currentInput
            stillTyping = false
        case 8:
            let number = sender.currentTitle!
             if stillTyping {
                 if (resultLabel.text?.count)! < 20 {
                     resultLabel.text = resultLabel.text! + number
                 }
             } else {
                 resultLabel.text = number
                 stillTyping = true
             }
        case 9:
            let number = sender.currentTitle!
             if stillTyping {
                 if (resultLabel.text?.count)! < 20 {
                     resultLabel.text = resultLabel.text! + number
                 }
             } else {
                 resultLabel.text = number
                 stillTyping = true
             }
        case 10:
            let number = sender.currentTitle!
             if stillTyping {
                 if (resultLabel.text?.count)! < 20 {
                     resultLabel.text = resultLabel.text! + number
                 }
             } else {
                 resultLabel.text = number
                 stillTyping = true
             }
        case 11:
            operationSign = sender.currentTitle!
            firstOperand = currentInput
            stillTyping = false
        case 12:
            let number = sender.currentTitle!
             if stillTyping {
                 if (resultLabel.text?.count)! < 20 {
                     resultLabel.text = resultLabel.text! + number
                 }
             } else {
                 resultLabel.text = number
                 stillTyping = true
             }
        case 13:
            let number = sender.currentTitle!
             if stillTyping {
                 if (resultLabel.text?.count)! < 20 {
                     resultLabel.text = resultLabel.text! + number
                 }
             } else {
                 resultLabel.text = number
                 stillTyping = true
             }
        case 14:
            let number = sender.currentTitle!
             if stillTyping {
                 if (resultLabel.text?.count)! < 20 {
                     resultLabel.text = resultLabel.text! + number
                 }
             } else {
                 resultLabel.text = number
                 stillTyping = true
             }
        case 15:
            operationSign = sender.currentTitle!
            firstOperand = currentInput
            stillTyping = false
            dotIsPlaced = false
            
        case 16:
            let number = sender.currentTitle!
             if stillTyping {
                 if (resultLabel.text?.count)! < 20 {
                     resultLabel.text = resultLabel.text! + number
                 }
             } else {
                 resultLabel.text = number
                 stillTyping = true
             }
        case 17:
            if stillTyping && !dotIsPlaced {
                resultLabel.text = resultLabel.text! + "."
                dotIsPlaced = true
            } else if !stillTyping && !dotIsPlaced {
                resultLabel.text = "0."
            }
        case 18:
            if stillTyping {
                secondOperand = currentInput
                dotIsPlaced = false
    
            }
            switch operationSign {
            case "+":
                operateWithTwoOperands {$0 + $1}
            case "-":
                operateWithTwoOperands {$0 - $1}
            case "×":
                operateWithTwoOperands {$0 * $1}
            case "÷":
                operateWithTwoOperands {$0 / $1}
        default:
            break
            }
        default:
            break
        }
       }
    
   
       }
        
    







