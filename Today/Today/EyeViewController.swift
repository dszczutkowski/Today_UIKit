//
//  EyeViewController.swift
//  Today
//
//  Created by Dave Szczutkowski on 30/06/2022.
//

import SnapKit

class EyeViewController: UIViewController {
    private let email = InputWithLabel(labelName: "email", placeholderName: "email@domain.com")
    private let password = InputWithLabel(labelName: "password")
    private let loginButton = UIButton()
    private let eye = UIImageView()
    private let viewContainer = UIStackView()
    private let elementsContainer = UIStackView()
    private let spacer = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(viewContainer)
        self.view.backgroundColor = .gray
        setupContainer()
    }
    
    func setupContainer() {
        viewContainer.spacing = 8
        viewContainer.axis = .vertical
        viewContainer.backgroundColor = UIColor(red: 59, green: 169, blue: 214, alpha: 0.9)
        viewContainer.layer.cornerRadius = 6
        viewContainer.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 120, left: 30, bottom: 120, right: 30))
        }
        
        viewContainer.addArrangedSubview(eye)
        viewContainer.addArrangedSubview(elementsContainer)
        
        setupLoginContainer()
        loginCircle()
    }
    
    func setupLoginContainer() {
        elementsContainer.addArrangedSubview(email.inputView)
        elementsContainer.addArrangedSubview(password.inputView)
        elementsContainer.addArrangedSubview(loginButton)
        elementsContainer.addArrangedSubview(spacer)
        elementsContainer.axis = .vertical
        elementsContainer.spacing = 8
        elementsContainer.backgroundColor = UIColor(red: 99, green: 199, blue: 234, alpha: 0.6)
        elementsContainer.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 250, left: 0, bottom: 120, right: 0))
        }
        
        setupButton()
        spacerView()
    }
    
    func loginCircle() {
        let dot = UIImageView()
        let dot2 = UIImageView()
        let dot3 = UIImageView()
        
        dot.center = CGPoint(x: 10, y: 15)
        eye.layer.cornerRadius = 180
        eye.backgroundColor = .black
        eye.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.top.equalToSuperview().offset(30)
            $0.bottom.equalTo(elementsContainer.snp.top).offset(-30)
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
    
    func setupButton() {
        loginButton.setTitle("Log in", for: .normal)
        loginButton.backgroundColor = .cyan
        loginButton.layer.cornerRadius = 10
        loginButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(70)
            $0.bottom.equalToSuperview().inset(30)
        }
    }
    
    func spacerView() {
        spacer.snp.makeConstraints {
            $0.height.equalTo(16)
        }
    }
}

struct InputWithLabel {
    var inputView = UIView()
    var label = UILabel()
    var input = UITextField()
    var placeholder = UILabel()
    
    init(labelName: String, placeholderName: String? = nil) {
        self.inputView.addSubview(label)
        self.inputView.addSubview(input)
        
        self.inputView.snp.makeConstraints {
            $0.height.equalTo(100)
        }
        
        self.label.text = labelName
        self.label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
        }
        
        self.input.backgroundColor = .todayGradientTodayBegin
        self.input.textInputView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
        }
        self.input.layer.cornerRadius = 10
        self.input.layer.borderWidth = 3
        self.input.layer.borderColor = CGColor(red: 99, green: 199, blue: 234, alpha: 0.6)
        self.input.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(70)
        }
        
        if(placeholderName != nil)
        {
            self.inputView.addSubview(placeholder)
            self.placeholder.snp.makeConstraints {
                $0.top.equalTo(input).offset(6)
                $0.leading.equalTo(input).offset(16)
            }
            self.placeholder.text = placeholderName
            self.placeholder.textColor = UIColor(red: 99, green: 99, blue: 99, alpha: 0.8)
            self.placeholder.font = .systemFont(ofSize: 12)
        }
    }
}
