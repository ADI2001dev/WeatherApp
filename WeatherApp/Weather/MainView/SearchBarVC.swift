//
//  SearchBarVC.swift
//  WeatherApp
//
//  Created by Adityakumar Ramnuj on 07/10/23.
//

import UIKit
import TinyConstraints


class SearchBarVC: UIViewController {
    
    var searchWeatherDB : [WeatherSearch] = []  //var of type Coredb
    let coreDataVMCall = DatabaseManager()
    let fromWeatherObj = SearchWeatherVM()
    var weatherLocationData: [WeatherResponse] = [] // api data stored in this var
    var collectionView : UICollectionView!
    
    private let MainView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor(red: 0.51, green: 0.549, blue: 0.682, alpha: 1)
        return cv
    }()
    private let lblLocation: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pick a location"
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.applyShadow()
        return label
    }()
    private let lblDesc: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Type the area or city you want to know the \n detailed weather information at \n this time"
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.applyShadow()
        return label
    }()
    private let SearchLocTxt: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.backgroundColor =  UIColor(red: 0.656, green: 0.706, blue: 0.879, alpha: 1)
        txtField.layer.cornerRadius = 20
        txtField.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        txtField.layer.shadowOffset = CGSize(width: 0, height: 4)
        txtField.layer.shadowOpacity = 0.3
        txtField.placeholder = "Search"
        txtField.textColor = .white
        
        return txtField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchWeatherDB = coreDataVMCall.fetchWeather()!
        handleWeatherEvent()
        setupUI()
        setupCollectionView()
        SearchLocTxt.delegate = self
    }
    
    private func setupUI() {
        view.addSubview(MainView)
        MainView.addSubview(lblLocation)
        MainView.addSubview(lblDesc)
        MainView.addSubview(SearchLocTxt)
        setupUIConstraints()
    }
    
    private func setupUIConstraints() {
        MainView.edgesToSuperview()
        
        lblLocation.centerX(to: MainView)
        lblLocation.top(to: MainView, offset: 90)
        lblDesc.left(to: MainView, offset: 55)
        lblDesc.right(to: MainView, offset: -55)
        lblDesc.topToBottom(of: lblLocation, offset: 5)
        SearchLocTxt.topToBottom(of: lblDesc, offset: 21)
        SearchLocTxt.height(63)
        SearchLocTxt.left(to: MainView, offset: 45)
        SearchLocTxt.right(to: MainView, offset: -45)
        setupUITextField()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 28)
        layout.itemSize = CGSize(width: 162, height: 200)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView = UICollectionView( frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(red: 0.51, green: 0.549, blue: 0.682, alpha: 1)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(SearchVCCell.self, forCellWithReuseIdentifier: "cell")
        MainView.addSubview(collectionView)
        
        collectionView.topToBottom(of: SearchLocTxt, offset: 31)

        collectionView.left(to: view.safeAreaLayoutGuide)
        collectionView.right(to: view.safeAreaLayoutGuide)
        collectionView.height(450)
   
    }
    
    private func setupUITextField() {
        let placeholderText = "Search"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
        ]
        let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)

        SearchLocTxt.attributedPlaceholder = attributedPlaceholder
        let leftView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 36, height: SearchLocTxt.frame.height))
        SearchLocTxt.leftView = leftView
        SearchLocTxt.leftViewMode = .always
    }
    
}

extension SearchBarVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let enteredText = textField.text {
            fromWeatherObj.search = enteredText
            fromWeatherObj.getWeatherData()
            textField.text = ""
        }
        textField.resignFirstResponder()
        return true
    }
    
    //this method listens to events that happping in cases data flow and also manages coredata operations
    func handleWeatherEvent() {
        fromWeatherObj.eventHandler = { [weak self] event in
            guard let self else { return }
            
            switch event {
            case .loading:
                print("loading....")
            case .stopLoading:
                print("stop loading...")
            case .dataLoaded:
                DispatchQueue.main.async {
                    
                    if let weatherData = self.fromWeatherObj.pickLocationData {
                        let temp = String(weatherData.main.temp)
                        let city = "\(weatherData.name), \(weatherData.sys.country)"
                        let image = "\(weatherData.weather[0].icon.dropLast())"
                        let weatherDesc = weatherData.weather[0].main
                        let id = "\(weatherData.id)"
                        
                        if self.coreDataVMCall.getDatabyId(id: id){
                            let _ = self.coreDataVMCall.updateWeather(id: id, temp: temp, city: city, image: image, weatherDesc: weatherDesc)
                        }
                        else
                        {
                            let _ = self.coreDataVMCall.addData(id: id, temp: temp, city: city, image: image, weatherDesc: weatherDesc)
                        }
                    }
                    self.searchWeatherDB = self.coreDataVMCall.fetchWeather()!
                    self.collectionView.reloadData()
                }
            case .error(_):
                DispatchQueue.main.async {
                    self.showToast(message: "The City you entered might not be available", font: .systemFont(ofSize: 12.0))
                }
            }
            
        }
    }
}

extension SearchBarVC: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(searchWeatherDB.count, 10)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SearchVCCell
        let index = indexPath.row
        
        if index < searchWeatherDB.count {
            cell?.configurationLocationCellDetails(searchWeatherDB[index])
        }
        return cell!
    }

}


