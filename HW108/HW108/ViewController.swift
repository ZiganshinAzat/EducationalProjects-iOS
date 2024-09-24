//
//  ViewController.swift
//  HW108
//
//  Created by Азат Зиганшин on 15.11.2023.
//

import UIKit

class ViewController: UIViewController {

    lazy var myView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        return view
    }() 

    lazy var slider: UISlider = {
        var slider = UISlider()
        slider.value = 0
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.backgroundColor = .black
        return slider
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(myView)
        view.addSubview(slider)

        NSLayoutConstraint.activate([
            slider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            slider.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        UIView.animate(withDuration: 3) {
//            self.myView.backgroundColor = .blue
//            self.myView.frame.size.width += 100
//        }

//        UIView.animate(withDuration: 4) {
//            self.myView.backgroundColor = .blue
//            self.myView.frame.size.width += 100
//        } completion: { isFinished in
//            guard isFinished else { return }
//
//            self.myView.backgroundColor = .white
//        }
        // completion блок не связан с анимацией

//        UIView.animate(withDuration: 0.5, delay: .zero, options: .curveEaseInOut) {
//
//            let transformAngle = CGAffineTransform(rotationAngle: .pi / 4)
//            let transformSize = CGAffineTransform(scaleX: 1.5, y: 1.5)
//            let transformMove = CGAffineTransform(translationX: 50, y: 50)
//            self.myView.transform = transformAngle.concatenating(transformSize).concatenating(transformMove)
//        } completion: { _ in
//
//            UIView.animate(withDuration: 0.5) {
//                self.myView.transform = .identity
//            }
//        }

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))

        view.addGestureRecognizer(tapGesture)

        let animator = UIViewPropertyAnimator(duration: 3, curve: .easeInOut) {
            self.myView.backgroundColor = .blue
            self.myView.bounds.size.width += 100
            self.myView.bounds.size.height += 100
        }

        animator.startAnimation()

        // Пауза анимации
        //animator.pauseAnimation()

        // Запустить обратную анимацию
        //animator.isReversed = true
        //animator.startAnimation()

        // Можно добавить completion блок для аниматора
//        animator.addCompletion { position in
//            guard position == .end else { return }
//        }

        // Есть разные состояния аниматора
        // animator.state    .active .inactive .stopped
        // animator.stopAnimation(bool)
        // animator.continueAnimation(withTimingParameters: <#T##UITimingCurveProvider?#>, durationFactor: <#T##CGFloat#>)

        // Можно менять процент прогресса анимации (от 0 до 1) animator.fractionComplete
        // С помощью слайдера animator.fractionComplete = CGFloat(slider.value)
    }

    @objc
    func tap() {
        print("tapped")
    }
}

