//
//  SnapKitTestViewController.swift
//  Today
//
//  Created by Dave Szczutkowski on 30/06/2022.
//

import Foundation
import SnapKit

class SnapKitTestViewController: UIViewController {
    let testView = UIView()
    let testButton = UIButton()
    let testButton2 = UIButton()
    let container = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(container)
        self.view.addSubview(testView)
        setupView()
    }
    
    func setupView() {
        container.alignment = .fill
        container.distribution = .fillEqually
        container.axis = .horizontal
        container.spacing = 8
        container.addArrangedSubview(testButton)
        container.addArrangedSubview(testButton2)
        container.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-30)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        
        testButton.setTitle("Test!", for: .normal)
        testButton.backgroundColor = .blue
        
        testButton2.setTitle("Test 2!", for: .normal)
        testButton2.backgroundColor = .systemPink
        
//        testButton.snp.makeConstraints {
////            $0.bottom.equalToSuperview().offset(-30)
//              $0.height.equalTo(50)
////            $0.leading.equalToSuperview().offset(16)
////            $0.trailing.equalToSuperview().offset(-16)
//        }
//        testButton2.snp.makeConstraints {
////            $0.bottom.equalToSuperview().offset(-30)
//              $0.height.equalTo(50)
////            $0.leading.equalToSuperview().offset(16)
////            $0.trailing.equalToSuperview().offset(-16)
//        }
        
        testView.backgroundColor = .red
        
        testView.snp.makeConstraints {
            //$0.edges.equalToSuperview().inset(UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}
