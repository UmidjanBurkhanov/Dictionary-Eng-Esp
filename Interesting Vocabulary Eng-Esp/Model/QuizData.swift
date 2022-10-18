//
//  QuizData.swift
//  Interesting Vocabulary Eng-Esp
//
//  Created by Umidjon Burhonov on 26/07/22.
//

import UIKit

struct QuizModel {
    let quizName: String
    let answers:  [String]
    let correctAnswer: String
}

struct QuizData {
    var quizNumber = 0
    var score      = 0
    
    let quizData = [
        QuizModel(quizName: "aftershock", answers: ["de nuevo","réplica","contra"], correctAnswer: "réplica"),
        QuizModel(quizName: "age", answers: ["edad","agente","hace"], correctAnswer: "edad"),
        QuizModel(quizName: "alignment", answers: ["hace","autorizar","alineación"], correctAnswer: "alineación"),
        QuizModel(quizName: "already", answers: ["ya","asímismo","siempre"], correctAnswer: "ya"),
        QuizModel(quizName: "bearea", answers: ["pompa","región","Asia"], correctAnswer: "región"),
        QuizModel(quizName: "awful", answers: ["tremendo","lezna","hacha"], correctAnswer: "tremendo"),
        QuizModel(quizName: "back", answers: ["reserva","espalda","clandestino"], correctAnswer: "espalda"),
        QuizModel(quizName: "badly", answers: ["confusión","fianza","mucho"], correctAnswer: "mucho"),
        QuizModel(quizName: "balance", answers: ["balanza","nudillo","báltico"], correctAnswer: "balanza"),
        
        QuizModel(quizName: "battle", answers: ["gritar","llevarse","batalla"], correctAnswer: "batalla"),
        QuizModel(quizName: "beauty", answers: ["dormitorio","remolacha","belleza"], correctAnswer: "belleza"),
        QuizModel(quizName: "betray", answers: ["traicionar","bicicleta","dormitorio"], correctAnswer: "traicionar"),
        QuizModel(quizName: "binary", answers: ["biología","binario","pájaro"], correctAnswer: "binario"),
        QuizModel(quizName: "blackberry", answers: ["zarzamora","bloque","golpe"], correctAnswer: "zarzamora"),
        QuizModel(quizName: "bottom", answers: ["boutique","taza","fondo"], correctAnswer: "fondo"),
        
        QuizModel(quizName: "branch", answers: ["pan","grieta","rama"], correctAnswer: "rama"),
        QuizModel(quizName: "caravan", answers: ["remolque","programa","cuidadoso"], correctAnswer: "remolque"),
        QuizModel(quizName: "certain", answers: ["remolque","cierto","cuidadoso"], correctAnswer: "cierto"),
        
        QuizModel(quizName: "cheese", answers: ["ajedrez","pollo","queso"], correctAnswer: "queso"),
        
        QuizModel(quizName: "excellent", answers: ["excepto","excitar","excelente"], correctAnswer: "excelente"),
        

        
    ]
    func getQuetion() -> String {
        return quizData[quizNumber].quizName
    }
    func getAnswers() -> [String] {
        return quizData[quizNumber].answers
    }
    func getScore() -> Int {
        return score
    }
    func getQuizNumber() -> Int {
        return quizNumber
    }
    mutating func nextQuistion() {
        if quizNumber < quizData.count - 1  {
            quizNumber += 1
        }else {
            quizNumber = 0
        }
    }
    mutating func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == quizData[quizNumber].correctAnswer {
            score += 1
            
            return true
        }else {
            return false
        }
        
    }
    
}
