//
//  Class.swift
//  Interesting Vocabulary Eng-Esp
//
//  Created by Umidjon Burhonov on 25/07/22.
//

import Foundation
import UIKit

class MyButton: UIButton{
    open override func layoutSubviews() {
        super.layoutSubviews()
    }
    init(title: String, fontSize: CGFloat, bgcColor: UIColor, titleColor: UIColor, radius: CGFloat,borderWidth: CGFloat){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: fontSize)//.boldSystemFont(ofSize: fontSize)
        self.backgroundColor = bgcColor
        self.setTitleColor(titleColor, for: .normal)
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
import UIKit

extension UIColor {
   static let welcomeBC =  #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
    static let startBC =  #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    static let learnBC =  #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
}

struct Constants {
    public static var appId = ""
}


