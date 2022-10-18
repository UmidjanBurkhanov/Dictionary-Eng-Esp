//
//  HomeViewController.swift
//  Interesting Vocabulary Eng-Esp
//
//  Created by Umidjon Burhonov on 25/07/22.
//

import UIKit
import Lottie
import SnapKit


class HomeViewController: UIViewController {

    let titleLabel = UILabel()
    let startBtn = UIButton()
    let examBtn  = UIButton()
    let quizBtn = UIButton()
    
        var animationView: AnimationView?
        var timer: Timer!
        override func viewDidLoad() {
            super.viewDidLoad()
            
            navigationController?.isNavigationBarHidden =  true

//            initAnimations()
            view.backgroundColor = .white
            titleView()
            startview()
            examView()
            quizView()
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       tabBarController?.tabBar.isHidden =  false
        animationView?.removeFromSuperview()
        initAnimations()
        navigationController?.isNavigationBarHidden =  true
    }
    
    
    
    private func titleView(){
//        let screenHeigth = self.view.frame.height
        view.addSubview(titleLabel)
        titleLabel.text = "Increase your vocabulary with us"
        titleLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
            titleLabel.font = .systemFont(ofSize: 35, weight: .heavy)
            titleLabel.snp.makeConstraints { make in
                make.top.equalTo(view.snp.top).offset(60)
                make.left.right.equalToSuperview().inset(10)
//                make.width.equalToSuperview()
                make.height.equalToSuperview().multipliedBy(0.3)
            }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        animationView?.play()
//
//    }
        private func initAnimations(){
            animationView = .init(name: "98297-book-idea")
//            animationView?.frame = view.bounds
            animationView?.loopMode = .loop
            animationView?.animationSpeed = 1
            view.addSubview(animationView!)
            view.sendSubviewToBack(animationView!)
            animationView?.play()
            animationView?.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
                make.left.right.equalToSuperview()
                
                
            }
        }
        
        private func startview() {
            view.addSubview(startBtn)
            startBtn.setTitle("English-Spanish", for: .normal)
            startBtn.setTitleColor(.white, for: .normal)
            startBtn.layer.borderColor = UIColor.lightGray.cgColor
            startBtn.layer.borderWidth = 1
            startBtn.layer.cornerRadius = 20
            startBtn.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]

            startBtn.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            startBtn.titleLabel?.font = .boldSystemFont(ofSize: 20)
            startBtn.snp.makeConstraints { make in
                make.right.equalToSuperview().inset(40)
                make.left.equalToSuperview()
                make.top.equalTo(view.snp.centerY).multipliedBy(1.42)
                make.height.equalToSuperview().multipliedBy(0.05)
            }
            
            
            startBtn.addTarget(self, action: #selector(engSpa), for: .touchUpInside)
        
    }
   
    private func examView(){
        view.addSubview(examBtn)
        examBtn.setTitle("Spanish-English", for: .normal)
        examBtn.setTitleColor(.white, for: .normal)
        examBtn.layer.borderColor = UIColor.lightGray.cgColor
        examBtn.layer.borderWidth = 1
//        examBtn.layer.cornerRadius = 20
        examBtn.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        examBtn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        examBtn.layer.cornerRadius = 20
                examBtn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        examBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(40)
            make.right.equalToSuperview()
            make.top.equalTo(startBtn.snp.bottom).offset(5)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        examBtn.addTarget(self, action: #selector(spaeng), for: .touchUpInside)
        
    }
    
    private func quizView(){
        view.addSubview(quizBtn)
        quizBtn.setTitle("Test your knowledge?", for: .normal)
        quizBtn.setTitleColor(.white, for: .normal)
        quizBtn.layer.borderColor = UIColor.lightGray.cgColor
        quizBtn.layer.borderWidth = 1
        quizBtn.layer.cornerRadius = 20
        quizBtn.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]

        quizBtn.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        quizBtn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        quizBtn.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(40)
            make.left.equalToSuperview()
            make.top.equalTo(examBtn.snp.bottom).offset(5)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        quizBtn.addTarget(self, action: #selector(quizVC), for: .touchUpInside)
        
    }
    
    @objc func engSpa(){
        let vc = EnglishSpainVC()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Orqaga",
                                                        style: .plain,
                                                        target: nil,
                                                        action: nil)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
        navigationController?.isNavigationBarHidden =  false

        tabBarController?.tabBar.isHidden =  true


    }
    
    @objc func spaeng(){
        let vc = SpainEnglishVC()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Orqaga",
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
        navigationController?.isNavigationBarHidden =  false

        tabBarController?.tabBar.isHidden =  true

    }
    
    @objc func quizVC(){
        let vc = QuizVC()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Orqaga",
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
        navigationController?.isNavigationBarHidden =  false

        tabBarController?.tabBar.isHidden =  true

    }
}

