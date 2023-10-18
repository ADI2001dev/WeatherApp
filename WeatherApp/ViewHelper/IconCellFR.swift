//
//  IconCellFR.swift
//  WeatherApp
//
//  Created by Adityakumar Ramnuj on 12/10/23.
//
//this is collection view cell used in view report View Controller
import Foundation
import TinyConstraints
import UIKit
import CoreData

class IconCellFR : UICollectionViewCell{
    let imgWeather: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.applyShadow()
        return imageView
    }()
    let lblDate: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 14.0)
        lbl.applyShadow()
        return lbl
    }()
    let lblTime: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
//        lbl.font = UIFont.systemFont(ofSize: 14.0)
        lbl.font = .robotoSlabLight(size: 14)
        lbl.applyShadow()
        return lbl
    }()
    let lblTemp: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 36.0)
        lbl.numberOfLines = 1
        lbl.applyShadow()
        return lbl
    }()
    let containerView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellProperty()
        setupUI()
        setupUIConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellProperty() {
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor(red: 0.656, green: 0.706, blue: 0.879, alpha: 1)
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    func setupUI() {
        self.addSubview(containerView)
        containerView.addSubview(lblDate)
        containerView.addSubview(lblTime)
        self.addSubview(lblTemp)
        self.addSubview(imgWeather)
    }
    
    func setupUIConstraints() {
        containerView.width(90)
        containerView.edgesToSuperview(excluding: .right, insets: UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 0))
        lblDate.edgesToSuperview(excluding: [.bottom], insets: UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0))
        lblTime.topToBottom(of: lblDate, offset: 1)
        lblTime.centerX(to: lblDate)
        lblTemp.leftToRight(of: containerView, offset: 20)
        lblTemp.center(in: self)
        imgWeather.centerX(to: self,offset: 120)
        imgWeather.centerY(to: self,offset: 0)
        imgWeather.size(CGSize(width: 70, height: 70))
    
    }
    
    func configureForecastCellDetails(_ data: List) {
        var date: String = ""
        var time: String = ""
        date += formateDate(date: data.dt_txt)
        time += formateTime(time: data.dt_txt)
        lblDate.text = "\(date)"
        lblTime.text = "\(time)"
        let temp = String(format: "%.1f", data.main.temp)
        lblTemp.text = "\(temp)c"
        imgWeather.image = UIImage(named: "\(data.weather[0].icon.dropLast())")
    }
    
    func formateDate(date: String) -> String {
        let dateString = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "dd-MM-yyyy"
            return dateFormatter.string(from: date)
        }
        return "11-11-2023"
    }
    
    func formateTime(time: String) -> String {
        let timeString = time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let date = dateFormatter.date(from: timeString) {
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: date)
        }
        return "09:00"
    }
}

