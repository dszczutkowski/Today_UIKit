//
//  EyeViewController.swift
//  Today
//
//  Created by Dave Szczutkowski on 30/06/2022.
//

import SnapKit

class EyeViewController: UIViewController {
    private let email = InputWithLabel(labelName: "email")
    private let password = InputWithLabel(labelName: "password")
    private let innerTable = UIView()
    private let loginButton = UIButton()
    private let container = UIStackView()
    private let eye = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(container)
        self.view.backgroundColor = .blue
        setupContainer()
        loginCircle()
    }
    
    func loginCircle() {
        let dot = UIImageView()
        let dot2 = UIImageView()
        let dot3 = UIImageView()
        dot.center = CGPoint(x: 10, y: 15)
        eye.layer.cornerRadius = 180
        eye.backgroundColor = .black
        eye.snp.makeConstraints {
            $0.trailing.equalTo(loginButton).offset(180)
        }
        self.eye.addSubview(dot2)
        self.eye.addSubview(dot3)
        self.eye.addSubview(dot)
        dot.backgroundColor = .white
        dot.layer.cornerRadius = 15
        dot.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.width.equalTo(30)
        }
        dot2.backgroundColor = .white
        dot2.layer.cornerRadius = 37
        dot2.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.width.equalTo(74)
        }
        dot3.backgroundColor = .black
        dot3.layer.cornerRadius = 35
        dot3.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.width.equalTo(70)
        }
    }
    
    func setupContainer() {
        container.alignment = .fill
        container.distribution = .fillEqually
        container.axis = .vertical
        container.spacing = 8
        container.addArrangedSubview(eye)
        container.addArrangedSubview(email.inputView)
        container.addArrangedSubview(password.inputView)
        container.addArrangedSubview(loginButton)
        container.backgroundColor = UIColor(red: 59, green: 169, blue: 214, alpha: 0.9)
        container.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 60, left: 30, bottom: 40, right: 30))
        }
        
        loginButton.setTitle("Log in", for: .normal)
        loginButton.backgroundColor = .cyan
        loginButton.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().offset(20)
            $0.height.equalTo(30)
        }
    }
}

struct InputWithLabel {
    var inputView = UIView()
    var label = UILabel()
    var input = UITextField()
    
    init(labelName: String, placeholderName: String? = nil) {
        self.inputView.addSubview(label)
        self.inputView.addSubview(input)
        
        self.inputView.snp.makeConstraints {
            $0.height.equalTo(input).offset(16)
        }
        
        self.label.text = labelName
        self.label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().offset(16)
        }
        
        self.input.backgroundColor = .todayGradientTodayBegin
        self.input.placeholder = placeholderName ?? "email@domain.com"
        self.input.placeholderRect(forBounds: CGRect(x: self.inputView.center.x, y: self.inputView.center.y, width: 50, height: 50))
        self.input.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom)
            $0.trailing.bottom.leading.equalToSuperview().offset(20)
        }
        
    }
}
