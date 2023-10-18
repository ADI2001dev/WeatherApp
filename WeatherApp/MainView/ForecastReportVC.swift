//
//  ForecastReportVC.swift
//  WeatherApp
//
//  Created by Adityakumar Ramnuj on 07/10/23.
//

import UIKit
import TinyConstraints

//this is view Report viewController it has two collection view which shows data
class ForecastReportVC: UIViewController {
    
    var forecastData: ForecastResponse? = nil
    
    init(forecastData: ForecastResponse? = nil) {
        self.forecastData = forecastData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let lblToday: UILabel = {
        let label = UILabel()
                label.text = "Today"
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
        }()
    
    private let lblDate: UILabel = {
        let label = UILabel()
                label.text = "october 18, 2023"
                label.font = UIFont.systemFont(ofSize: 15)
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
        }()
    
    private var lblFR : UILabel = {
        let label = UILabel()
        label.text = "Forecast Report"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor.white
        return label
    }()
    
    private let lblNextForecast: UILabel = {
        let label = UILabel()
                label.text = "Next Forecast"
                label.font = UIFont.systemFont(ofSize: 17)
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
        }()
    
    private var collectionViewFR  : UICollectionView = {
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
    
    private var collectionViewNextFC : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 13, bottom: 0, right: 13)
        layout.minimumLineSpacing = 20
        layout.estimatedItemSize = CGSize(width: 352 , height: 84)
        
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(red: 0.51, green: 0.549, blue: 0.682, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(IconCellFR.self, forCellWithReuseIdentifier: "IconCellFR")
        return collectionView
    }()
    
    let forecastVMInst = MyLocationVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5080776215, green: 0.5482829213, blue: 0.6820377707, alpha: 1)
              
        self.view.addSubview(lblFR)
        lblFR.topToSuperview(offset: 50)
        lblFR.leadingToSuperview(offset: 90)
        lblFR.width(224)
        lblFR.height(40)

        view.addSubview(collectionViewFR)
        collectionViewFR.delegate = self
        collectionViewFR.dataSource = self
        
        collectionViewFR.topToBottom(of: lblFR,offset: 62)
        collectionViewFR.left(to: view.safeAreaLayoutGuide)
        collectionViewFR.right(to: view.safeAreaLayoutGuide)
        collectionViewFR.height(85)
        
        view.addSubview(lblNextForecast)
        lblNextForecast.topToBottom(of: collectionViewFR,offset: 23)
        lblNextForecast.left(to: view.safeAreaLayoutGuide,offset: 29)
        lblNextForecast.textColor = .white
        
        view.addSubview(collectionViewNextFC)
        collectionViewNextFC.delegate = self
        collectionViewNextFC.dataSource = self
        
        collectionViewNextFC.topToBottom(of: lblNextForecast,offset: 29)
        collectionViewNextFC.left(to: view.safeAreaLayoutGuide)
        collectionViewNextFC.right(to: view.safeAreaLayoutGuide)
        collectionViewNextFC.height(450)
        
        view.addSubview(lblToday)
        lblToday.topToBottom(of: lblFR,offset: 30)
        lblToday.left(to: view.safeAreaLayoutGuide,offset: 29)
        lblToday.textColor = .white
        
        view.addSubview(lblDate)
        lblDate.topToBottom(of: lblFR, offset: 30)
        lblDate.leading(to: lblToday, offset: 219)
        /*lblDate.right(to: view.safeAreaLayoutGuide,offset: 13)*/ //top and leading no width
        lblDate.textColor = .white
        
    }
}

extension ForecastReportVC : UICollectionViewDelegate {
}

extension ForecastReportVC : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewFR {
            return (forecastVMInst.forecastData?.list.count) ?? 10//return count
        }
        else if collectionView == collectionViewNextFC{
            return (forecastData?.list.count) ?? 5
           
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewFR{

            if let forecastData = forecastData?.list {
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
        else if collectionView == collectionViewNextFC {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconCellFR", for: indexPath) as? IconCellFR
            if let forecastItem = forecastData?.list[indexPath.row] {
                cell?.configureForecastCellDetails(forecastItem)
            } else {
                // Handle the case where forecastData?.list[indexPath.row] is nil
                print("Error: forecastData?.list[indexPath.row] is nil")
            }
            return cell!
        }
        return UICollectionViewCell()
    }
    
}





