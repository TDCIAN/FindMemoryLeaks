//
//  ViewController.swift
//  FindMemoryLeaks
//
//  Created by JeongminKim on 2022/03/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton()
        button.setTitle("Tap Me", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc private func didTapButton() {
        let vc = SecondVC()
        present(vc, animated: true)
    }
}

class MyView: UIView {
//    let vc: UIViewController
    weak var vc: UIViewController?
    
    init(vc: UIViewController) {
        self.vc = vc
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SecondVC: UIViewController {
    var myView: MyView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        myView = MyView(vc: self)
    }
}
