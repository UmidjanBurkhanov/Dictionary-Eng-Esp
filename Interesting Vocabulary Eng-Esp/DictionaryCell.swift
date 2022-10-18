//
//  DictionaryCell.swift
//  Interesting Vocabulary Eng-Esp
//
//  Created by Umidjon Burhonov on 26/07/22.
//


import UIKit

class DictionaryCell: UICollectionViewCell {
    static let identifier = "DictionaryCell"
    
    public var topLabel: UILabel = {
       let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 25, weight: .regular)
        
        
        return label
    }()
    public var underLabel: UILabel = {
       let label = UILabel()
       
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
         label.font = .systemFont(ofSize: 15, weight: .regular)
         
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 18
        self.backgroundColor = #colorLiteral(red: 0.8196078431, green: 0.8, blue: 0.7529411765, alpha: 1)
        self.addSubview(topLabel)
        self.addSubview(underLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY).multipliedBy(0.6)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        underLabel.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
    }
}
