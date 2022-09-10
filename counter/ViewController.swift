//
//  ViewController.swift
//  counter
//
//  Created by Damir Chalkarov on 10.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var digits = UILabel()
    var firstLine = ["AC", "±", "÷", "%"]
    var secondLine = ["7", "8", "9", "×"]
    var thirdLine = ["4", "5", "6", "-"]
    var fourthLine = ["1", "2", "3", "+"]
    var fifthLine = [",", "="]
    var fifthLine1 = ["0"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(digits)
        digits.text = "0"
        digits.textColor = UIColor.black
        digits.textAlignment = .right
        digits.font = .systemFont(ofSize: 100)
        
        digits.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            digits.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 190),
            digits.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        let stackView1 = UIStackView(arrangedSubviews: firstLine.map { makeButton(with: $0) })
        stackView1.spacing = 6
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.distribution = .fillEqually
        view.addSubview(stackView1)
        
        NSLayoutConstraint.activate([
            stackView1.topAnchor.constraint(equalTo: digits.bottomAnchor, constant: 10),
            stackView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

       
        let stackView2 = UIStackView(arrangedSubviews: secondLine.map { makeButton(with: String($0)) })
        stackView2.spacing = 6
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.distribution = .fillEqually
        view.addSubview(stackView2)
        
        NSLayoutConstraint.activate([
            stackView2.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 10),
            stackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        let stackView3 = UIStackView(arrangedSubviews: thirdLine.map { makeButton(with: String($0)) })
        stackView3.spacing = 6
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        stackView3.distribution = .fillEqually
        view.addSubview(stackView3)
        
        NSLayoutConstraint.activate([
            stackView3.topAnchor.constraint(equalTo: stackView2.bottomAnchor, constant: 10),
            stackView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        let stackView4 = UIStackView(arrangedSubviews: fourthLine.map { makeButton(with: String($0)) })
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
    
    func makeButton(with meaning: String) -> UIButton {
        let button = UIButton()
        
        button.setTitle("\(meaning)", for: .normal)
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
        button.layer.masksToBounds = false
        return button
    }


}

