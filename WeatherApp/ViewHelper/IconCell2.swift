//
//  IconCelll2.swift
//  WeatherApp
//
//  Created by Adityakumar Ramnuj on 14/10/23.
//

import Foundation
import UIKit
import TinyConstraints

class IconCell2 : UICollectionViewCell {
    //    static let identifier = IconCell.description()
        
        private let MainView : UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        private var stackView: UIStackView  = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.alignment = .center
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        private var ImageView : UIImageView  = {
            let View = UIImageView()
            View.translatesAutoresizingMaskIntoConstraints = false
            View.image = UIImage(named: "rainDrops")
            return View
        }()
        
        private var lblTime: UILabel = {
            let label = UILabel()
                    label.text = ""
                    label.translatesAutoresizingMaskIntoConstraints = false
                    label.font = UIFont.systemFont(ofSize: 12)
                    return label
            }()
        
        private var lblTemp: UILabel = {
            let label = UILabel()
                    label.text = "25°C"
                    label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 17)
                    return label
            }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = UIColor(red: 0.656, green: 0.706, blue: 0.879, alpha: 1)
            self.layer.cornerRadius = 30

            MainView.addSubview(lblTemp)
            MainView.addSubview(lblTime)
            stackView.addArrangedSubview(ImageView)
            stackView.addArrangedSubview(MainView)
            self.addSubview(stackView)
        
            lblTime.leading(to: MainView,offset: 10)
            lblTime.centerY(to: MainView,offset: -10)
            lblTime.textColor = .white
            
            lblTemp.leading(to: MainView,offset: 10)
            lblTemp.centerY(to: MainView,offset: 10)
            lblTemp.textColor = .white
            
            stackView.arrangedSubviews.forEach { child in
                child.height(self.frame.height)
                child.width(self.frame.width/2)
            }
            stackView.edgesToSuperview()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        func configureForecastCellDetails(_ data: List) {
    //        imgWeather.image = UIImage(named: "\(data.weather[0].icon.dropLast())")
    //        imgWeather.setImage(with: "\(Constant.URL.weatherImageUrl)\(data.weather[0].icon)@2x.png")
            lblTemp.text = "\(data.main.temp) c"
            lblTime.text = formateDate(date: data.dt_txt)
        }
        
        func configureDefaultDetails() {
    //        imgWeather.setImage(with: "\(Constant.URL.weatherImageUrl)10d@2x.png")
            lblTime.text = "10:00 pm"
            lblTemp.text = "10 c"
        }
        
        func formateDate(date: String) -> String {
            let dateString = date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            if let date = dateFormatter.date(from: dateString) {
                dateFormatter.dateFormat = "HH:mm"
                return dateFormatter.string(from: date)
            } else {
                return "10: 00pm"
            }
        }
    }
