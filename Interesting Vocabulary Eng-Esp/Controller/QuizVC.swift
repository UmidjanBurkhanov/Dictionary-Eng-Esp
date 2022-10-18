//
//  QuizVC.swift
//  Interesting Vocabulary Eng-Esp
//
//  Created by Umidjon Burhonov on 26/07/22.
//

import UIKit
import AVFoundation
import Lottie

class QuizVC: UIViewController {
    
    var questions = QuizData()
    var player   = AVAudioPlayer()
    var animationView: AnimationView?
    
    public var quizBackgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "QuizImage")
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        
        return imageView
    }()
    
    
    public var answerNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Saydullo"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 45, weight: .semibold)
        
        return label
    }()
    
    public var quizNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "Find the translation of the above word Dear Scholars !!!"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.layer.masksToBounds = true
        label.font = .systemFont(ofSize: 35, weight: .regular)
        
        return label
    }()
    
    

    
    public var scoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "Score:"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.clipsToBounds = true
        label.layer.masksToBounds = true
        label.font = .systemFont(ofSize: 35, weight: .regular)
        
        return label
    }()
    public var choice1Button: UIButton = {
        let button = UIButton()
        button.setTitle("Name answer", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Times New Roman", size: 25)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowRadius = 5
        button.layer.cornerRadius = 20
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
        return button
    }()
    public var choice2Button: UIButton = {
        let button = UIButton()
        button.setTitle("Name answer", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Times New Roman", size: 25)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowRadius = 5
        button.layer.cornerRadius = 20
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
        return button
    }()
    public var choice3Button: UIButton = {
        let button = UIButton()
        button.setTitle("Name answer", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Times New Roman", size: 25)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowRadius = 5
        button.layer.cornerRadius = 20
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
        return button
    }()
    private func initanimation() {
        animationView = .init(name : "44177-quiz")
        animationView?.frame = view.bounds
        animationView?.loopMode = .loop
        animationView?.animationSpeed = 1
        view.addSubview(animationView!)
        animationView?.play()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initanimation()

        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(quizBackgroundImage)
        quizBackgroundImage.addSubview(answerNameLabel)
        view.addSubview(quizNameLabel)
        view.addSubview(scoreLabel)
        view.addSubview(choice1Button)
        view.addSubview(choice2Button)
        view.addSubview(choice3Button)
        choice3Button.addTarget(self, action: #selector(answerButtonTapped(sender:)), for: .touchUpInside)
        choice2Button.addTarget(self, action: #selector(answerButtonTapped(sender:)), for: .touchUpInside)
        choice1Button.addTarget(self, action: #selector(answerButtonTapped(sender:)), for: .touchUpInside)
        updateQuiz()

        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        quizBackgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.centerY).multipliedBy(0.65)
        
        }
        
        answerNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(45)
            make.bottom.equalToSuperview()
            
        }
        quizNameLabel.snp.makeConstraints { make in
            make.top.equalTo(quizBackgroundImage.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(view.snp.width).multipliedBy(0.75)
        }
        scoreLabel.snp.makeConstraints { make in
            make.top.equalTo(choice3Button.snp.top).offset(-60)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        choice1Button.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.centerY).multipliedBy(1.85)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.left.right.equalToSuperview().inset(30)
            
        }
        choice2Button.snp.makeConstraints { make in
            make.bottom.equalTo(choice1Button.snp.top).offset(-10)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.left.right.equalToSuperview().inset(30)
            
        }
        choice3Button.snp.makeConstraints { make in
            make.bottom.equalTo(choice2Button.snp.top).offset(-10)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.left.right.equalToSuperview().inset(30)
            
        }
        
        
    }
    
    @objc func answerButtonTapped(sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let answerIsTrue = questions.checkAnswer(userAnswer: userAnswer)
        if answerIsTrue {
            playCorrectSound()
        }else {
            incorrectSound()
        }
        questions.nextQuistion()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateQuiz), userInfo: self, repeats: false)
        if questions.getQuizNumber() == 0 {
            
            showAlert()
        }
        
    }
    
    @objc func updateQuiz() {
        answerNameLabel.text = questions.getQuetion()
        let answers = questions.getAnswers()
        choice3Button.setTitle(answers[0], for: .normal)
        choice2Button.setTitle(answers[1], for: .normal)
        choice1Button.setTitle(answers[2], for: .normal)
        choice3Button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        choice2Button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        choice1Button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        scoreLabel.text = "Score: \(questions.getScore()) "
        
    }
    
    @objc func backTo() {
        dismiss(animated: true, completion: nil)
    }
    
    func playCorrectSound() {
        let url = Bundle.main.url(forResource: "right", withExtension: "mp3")
        player = try!AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    func incorrectSound() {
        let url = Bundle.main.url(forResource: "incorrect", withExtension: "wav")
        player = try!AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    func showAlert() {
        let alert = UIAlertController(title: "Your Score: \(questions.getScore())", message: "Great!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { alert in
            self.backTo()
        }))
        present(alert, animated: true)
        congratulateSound()
    }
    func congratulateSound() {
        let url = Bundle.main.url(forResource: "correct", withExtension: "mp3")
        player = try!AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    
    
    @objc func ViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
