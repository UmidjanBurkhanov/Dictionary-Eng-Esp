//
//  EngEspVC.swift
//  Interesting Vocabulary Eng-Esp
//
//  Created by Umidjon Burhonov on 26/07/22.
//

import Foundation
import UIKit

class EnglishSpainVC: UIViewController, UISearchBarDelegate, UISearchControllerDelegate {
    
    var isChanged           = false
    var number              = 1
    let data                =  Words.words
    var filterWords:[WordsStruct] = []
    weak var collectionView : UICollectionView!
    
    public var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.layer.cornerRadius = 40
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        
        return view
    }()
    public var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "English - Spanish"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = .systemFont(ofSize: 30, weight: .light)
        label.adjustsFontSizeToFitWidth = true
        label.layer.masksToBounds = true
        label.clipsToBounds = true
        label.textAlignment  = .center
        
        
        return label
    }()
    public var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrow-left"), for: .normal)
        
        return button
    }()
    public var changeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "exchange"), for: .normal)
        return button
    }()
    public var myView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.8666666667, blue: 0.8823529412, alpha: 1)
        view.layer.cornerRadius = 45
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    public var  cornerRadiusView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        return view
    }()
    public var sarchBar: UISearchBar = {
        let search = UISearchBar()
        
        search.placeholder = "Search..."
        search.layer.cornerRadius = 10
        search.clipsToBounds = true
        if #available(iOS 13.0, *) {
            search.searchTextField.borderStyle = .none
        } else {
            // Fallback on earlier versions
        }
        
        
        return search
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.8666666667, blue: 0.8823529412, alpha: 1)
        view.addSubview(backgroundView)
        view.addSubview(cornerRadiusView)
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(backButton)
        view.addSubview(sarchBar)
        backgroundView.addSubview(changeButton)
        sarchBar.delegate = self
        filterWords = data
        view.addSubview(myView)
        verticalCollectionView()
        changeButton.addTarget(self, action: #selector(changedWords), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(nextButton), for: .touchUpInside)
        
        
        
    }
    
    func verticalCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.register(DictionaryCell.self, forCellWithReuseIdentifier: DictionaryCell.identifier)
        self.collectionView = collectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(backgroundView.snp.bottom).offset(15)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.centerY).multipliedBy(0.45)
            
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.centerY).multipliedBy(0.1)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(view.snp.centerY).multipliedBy(0.25)
        }
        backButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.leading.equalToSuperview().inset(15)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        changeButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(15)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        myView.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        cornerRadiusView.snp.makeConstraints { make in
            
            make.top.equalTo(backgroundView.snp.centerY)
            make.left.equalToSuperview()
            make.height.width.equalTo(250)
            
        }
        sarchBar.snp.makeConstraints { make in
            make.bottom.equalTo(backgroundView.snp.bottom).offset(-15)
            make.left.right.equalToSuperview().inset(15)
            make.height.equalTo(40)
            
        }
        
        
        
    }
    @objc func nextButton() {
        let vc = ViewController()
        vc.modalPresentationStyle = .fullScreen
        dismiss(animated: true, completion: nil)
    }
    
    
}
extension EnglishSpainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterWords.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DictionaryCell.identifier, for: indexPath) as! DictionaryCell
        if isChanged == true {
            cell.topLabel.text = filterWords[indexPath.item].spanish
            cell.underLabel.text = filterWords[indexPath.item].english
            
        }else{
            cell.topLabel.text = filterWords[indexPath.item].english
            cell.underLabel.text = filterWords[indexPath.item].spanish
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        startSearch(text: searchText)
        print(searchText)
    }
    func startSearch(text: String) {
        if (text.isEmpty) {
            filterWords = data
            
        }else {
            filterWords = []
            for i in data {
                if i.english.contains(text.lowercased()) {
                    filterWords.append(i)
                    
                }
            }
        }
        collectionView.reloadData()
    }
    @objc func changedWords() {
        if number == 1 {
            isChanged = true
            collectionView.reloadData()
            number = 2
        }else{
            isChanged = false
            collectionView.reloadData()
            number = 1
        }
    }
}
