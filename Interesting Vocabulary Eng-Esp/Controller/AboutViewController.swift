//
//  AboutViewController.swift
//  Interesting Vocabulary Eng-Esp
//
//  Created by Umidjon Burhonov on 25/07/22.
//

import UIKit

class AboutViewController: UIViewController {
   
    let backView = UIView()
    let definition = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

    

       
           
          
            
                title = "Dastur haqida"
        
              
                    let appearance = UINavigationBarAppearance()
                    appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
                    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.red]
        appearance.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
                    navigationItem.standardAppearance = appearance
             
                //navigationItem.scrollEdgeAppearance = appearance
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                initViews()
            }
            private func initViews(){
                
                view.addSubview(backView)
                view.sendSubviewToBack(backView)
                backView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                backView.layer.cornerRadius = 20
                backView.layer.borderWidth = 1
                backView.layer.borderColor = UIColor.gray.cgColor
                
                backView.snp.makeConstraints { make in
                    make.top.equalToSuperview()
                    make.bottom.equalToSuperview()
                    make.centerX.equalToSuperview()
                    make.width.equalToSuperview()
                }
                view.addSubview(definition)
                definition.text = """
           

                This program is a very special and convenient program for those who are learning English or Spanish. You can learn more than 1000 new words in the application. There is also a "Find words" game in the application, in which you can You can find the correct translation of them
        """
                definition.textAlignment = .center
                definition.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                definition.isEditable = false
                definition.font = .systemFont(ofSize: 20, weight: .bold)
                definition.layer.cornerRadius = 20
                definition.backgroundColor = .clear
                
                definition.snp.makeConstraints { make in
                    make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
                    make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-20)
                    make.centerX.equalToSuperview()
                    make.width.equalToSuperview().multipliedBy(0.90)
                }
                
                
            }
        }

