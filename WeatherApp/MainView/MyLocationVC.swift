//
//  ViewController.swift
//  WeatherApp
//
//  Created by Adityakumar Ramnuj on 06/10/23.
//
//Main VC which show weather and Description 
import UIKit
import CoreLocation
import TinyConstraints

class MyLocationVC: UIViewController, CLLocationManagerDelegate {

    let forecastViewModel = MyLocationVM()
    let weatherViewModel = SearchWeatherVM()
    private var cnt : Int = 0
    var lat: Double? = 0.0
    var lon: Double? = 0.0
    
    //Bottom Cells
    private var collectionViewBottom  : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 13)
        layout.minimumLineSpacing = 20
        layout.estimatedItemSize = CGSize(width: 166 , height: 85)
        
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(red: 0.51, green: 0.549, blue: 0.682, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(IconCell.self, forCellWithReuseIdentifier: "IconCell")
        return collectionView
    }()
    
    private let scrollViewB: UIScrollView = { //hide navigation bar
            let scrollViewB = UIScrollView()
            scrollViewB.translatesAutoresizingMaskIntoConstraints = false
            return scrollViewB
        }()
    
    private let containerviewB: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        private let imageViewB: UIImageView = {
            let imageViewB = UIImageView()
            imageViewB.image = UIImage(named: "rainDrops")
            imageViewB.translatesAutoresizingMaskIntoConstraints = false
            return imageViewB
        }()
    
    let lblCity: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.text = ""
           label.textAlignment = .center
        label.font = .robotoSlabMedium(size: 30)
           label.textColor = .white
        label.applyShadow()
           return label
       }()
    
    let lblDate : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    let iconImg : UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        return iconImageView
    }()
    
    let lblTemp2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Temp"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        
        label.textColor = .white
        return label
    }()
    
    private var lblTemp2Value: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let lblhm : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Humidity"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    private var lblhmValue: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let lblWind : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Wind"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    private var lblWindValue: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()

    let lblToday : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Today"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    let btnViewReport : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("View Report", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0.1479336321, blue: 0.5373396873, alpha: 1), for: .normal)

        return btn
    }()
    
    let lblTemp : UILabel = {
        let lblTemp = UILabel()
        lblTemp.translatesAutoresizingMaskIntoConstraints = false
        lblTemp.text = ""
        lblTemp.textAlignment = .center
        lblTemp.font = UIFont.systemFont(ofSize: 70)
        lblTemp.textColor = .white
        return lblTemp
    }()
    
    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let stackView : UIStackView = {
        let stackView = UIStackView()
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.axis = .horizontal
         stackView.spacing = 4
         stackView.alignment = .center
        return stackView
    }()
        
    var manager : CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupUIConstraints()
        CurrentWeatherDataLoaded()
        ForecastDataLoaded()
        }
    
    private func setupUI(){
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        let iconData = [("09", "Rain"), ("13", "Drizz"), ("03","Cloudy"), ("50", "Haze"), ("Zaps","Lightning"), ("01","Sunny")]
        for (iconName, labelText) in iconData {
            let containerView = UIView()
            
            let imageView = UIImageView(image: UIImage(named: iconName))
            imageView.contentMode = .scaleAspectFit
            
            let label = UILabel()
            label.text = labelText
            label.textAlignment = .center
            label.textColor = .white
            
            containerView.addSubview(imageView)
            containerView.addSubview(label)
            
            imageView.width(60)
            imageView.height(60)

            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            label.translatesAutoresizingMaskIntoConstraints = false
            
            imageView.top(to: containerView)
            imageView.centerX(to: containerView)
            
            label.topToBottom(of: imageView, offset: 5)
            label.leadingToSuperview()
            label.trailingToSuperview()
            
            stackView.addArrangedSubview(containerView)
            stackView.setCustomSpacing(10, after: containerView)
        }
        
        view.addSubview(lblCity)
        view.addSubview(lblDate)
        view.addSubview(iconImg)
        view.addSubview(lblTemp)
        view.addSubview(lblTemp2)
        view.addSubview(lblTemp2Value)
        view.addSubview(lblhm)
        view.addSubview(lblhmValue)
        view.addSubview(lblWind)
        view.addSubview(lblWindValue)
        view.addSubview(lblToday)
        view.addSubview(btnViewReport)
        view.addSubview(collectionViewBottom)
    }
    
    private func setupUIConstraints(){
        scrollView.edgesToSuperview(excluding: [.bottom], insets: TinyEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),usingSafeArea: true )
        scrollView.height(89)
        scrollView.backgroundColor = #colorLiteral(red: 0.4713271856, green: 0.5080776215, blue: 0.6568930745, alpha: 1)
        
        stackView.distribution = .fillEqually
        stackView.edgesToSuperview(insets: TinyEdgeInsets(top: 0, left: 25, bottom: 0, right: 0))
       stackView.edgesToSuperview()
        
        lblCity.topToBottom(of: scrollView, offset: 23)
        lblCity.centerXToSuperview()
        lblDate.topToBottom(of: lblCity, offset: 3)
        lblDate.centerXToSuperview()
        iconImg.topToBottom(of: lblDate, offset: 24)
        iconImg.width(155)
        iconImg.height(155)
        iconImg.centerXToSuperview()
        lblTemp.topToBottom(of: iconImg, offset: 0)
        lblTemp.centerXToSuperview()
        lblTemp2.topToBottom(of: lblTemp, offset: 38)
        lblTemp2.centerX(to:view.safeAreaLayoutGuide, offset: -150)
        lblTemp2Value.topToBottom(of: lblTemp2, offset: 0)
        lblTemp2Value.centerX(to:view.safeAreaLayoutGuide, offset: -150)
        lblhm.topToBottom(of: lblTemp, offset: 38)
        lblhm.centerX(to:view.safeAreaLayoutGuide)
        lblhmValue.topToBottom(of: lblhm, offset: 0)
        lblhmValue.centerX(to:view.safeAreaLayoutGuide)
        lblWind.topToBottom(of: lblTemp, offset: 38)
        lblWind.centerX(to:view.safeAreaLayoutGuide, offset: 150)
        lblWindValue.topToBottom(of: lblWind, offset: 0)
        lblWindValue.centerX(to:view.safeAreaLayoutGuide, offset: 140)
        lblToday.topToBottom(of: lblTemp,offset: 115)
        lblToday.left(to: view.safeAreaLayoutGuide,offset: 24)
        btnViewReport.addTarget(self, action: #selector(pushForecastReport), for: .touchUpInside)
        btnViewReport.topToBottom(of: lblTemp,offset: 115)
        btnViewReport.right(to: view.safeAreaLayoutGuide,offset: -21)
        collectionViewBottom.delegate = self
        collectionViewBottom.dataSource = self
        collectionViewBottom.topToBottom(of: lblToday,offset: 24)
        collectionViewBottom.left(to: view.safeAreaLayoutGuide)
        collectionViewBottom.right(to: view.safeAreaLayoutGuide)
        collectionViewBottom.height(85)
        
    }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            self.navigationController?.isNavigationBarHidden = true //hide navigation bar
            manager = CLLocationManager()
            manager?.delegate = self
            manager?.desiredAccuracy  = kCLLocationAccuracyBest
            manager?.requestWhenInUseAuthorization()
            manager?.startUpdatingLocation()
        }
    
//MARK: - View Report Button
    @objc func pushForecastReport() {  // Calling New Vm called Forecast Report
        if self.forecastViewModel.forecastData != nil {
            let forecastVC = ForecastReportVC(forecastData: forecastViewModel.forecastData)
            self.navigationController?.pushViewController(forecastVC, animated: true)
        }
        else
        {
            return
        }
    }
        
        //MARK: - Location Manager
    //it is responsible to current latest location and fetches latitude and longitude 
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let first = locations.first else{
            return
        }
        weatherViewModel.lat = first.coordinate.latitude
        weatherViewModel.lon = first.coordinate.longitude
        forecastViewModel.lat = weatherViewModel.lat
        forecastViewModel.lon = weatherViewModel.lon
        weatherViewModel.getWeatherData()
        forecastViewModel.getForecastData()
      
    }
    
    
    //it takes appropriate actions according to cases and shows data also configure the details that is shown in main screen like temp, city of live location loads current weather info
    private func CurrentWeatherDataLoaded() {
        weatherViewModel.eventHandler = { [weak self] event in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch event {
                case .loading:
                    self.showIndicator()
                case .stopLoading:
                    self.dismissIndicator()
                case .dataLoaded:
                    self.configureWeatherDetails()
                case .error(_):
                    self.showToast(message: "Error while fetching the weather request", font: .systemFont(ofSize: 12.0))
                }
            }
        }
    }
    
    func configureWeatherDetails() {
       guard let weather = weatherViewModel.weatherData else { return }
       lblCity.text = weather.name
       formatDate(dt: weather.dt)
       lblTemp.text = "\(weather.main.temp) c"
       lblTemp2Value.text = "\(weather.main.temp) c"
       lblhmValue.text = "\(weather.main.humidity)%"
       lblWindValue.text = "\(weather.wind.speed) kmph"
       iconImg.image = UIImage(named: "\(weather.weather[0].icon.dropLast())")
   }
    
    // it loads and shows the data of forecast 5days of 3hours intervals in Cell at bottom
    private func ForecastDataLoaded() {
        forecastViewModel.eventHandler = { [weak self] event in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch event {
                case .loading:
                    self.showIndicator()
                case .stopLoading:
                    self.dismissIndicator()
                case .dataLoaded:
                    self.collectionViewBottom.reloadData()
                case .error(_):
                    self.showToast(message: "Error while fetching the weather request", font: .systemFont(ofSize: 12.0))
                }
            }
        }
    }
    private func formatDate(dt: Int) {
        let timestamp = TimeInterval(dt)
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let formattedDate = dateFormatter.string(from: date)
        lblDate.text = formattedDate
        }
    }


extension MyLocationVC : UICollectionViewDelegate {
    
}

extension MyLocationVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (forecastViewModel.forecastData?.list.count) ?? 10
        //40 rows are coming we showd 10 here
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let forecastData = forecastViewModel.forecastData?.list {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconCell", for: indexPath) as? IconCell
            cell!.configureForecastCellDetails(forecastData[indexPath.row])
            return cell!
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconCell", for: indexPath) as? IconCell
            cell!.configureDefaultDetails()
            return cell!
        }
       
    }
    
}

    

