//
//  SearchVCCell.swift
//  WeatherApp
//
//  Created by Adityakumar Ramnuj on 12/10/23.
//
//this is collection view cell used in search bar 
import Foundation
import TinyConstraints
import UIKit
import CoreData

class SearchVCCell : UICollectionViewCell{
    static let identifier = SearchVCCell.description()
    private var ImageView : UIImageView  = {
        let View = UIImageView()
        View.translatesAutoresizingMaskIntoConstraints = false
        View.image = UIImage(named: "")
        return View
    }()
    
    let lblTemp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center

        return label
    }()
    
    let lblCity: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.text = ""
        label.applyShadow()
        return label
    }()
    
    private var lblDesc: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
         label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.text = ""
         label.textAlignment = .center
         label.applyShadow()
         return label

        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.656, green: 0.706, blue: 0.879, alpha: 1)
        self.layer.cornerRadius = 20
        
        self.addSubview(lblTemp)
        self.addSubview(ImageView)
        self.addSubview(lblDesc)
        self.addSubview(lblCity)
        lblTemp.height(26)
        lblTemp.edgesToSuperview(excluding: .bottom, insets: UIEdgeInsets(top: 22, left: 8, bottom: 0, right: 8))
        ImageView.height(80)
        ImageView.topToBottom(of: lblTemp, offset: 1)
        ImageView.edgesToSuperview(excluding: [.top, .bottom], insets: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
        lblDesc.height(24)
        lblDesc.topToBottom(of: ImageView, offset: 1)
        lblDesc.edgesToSuperview(excluding: [.top, .bottom], insets: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
    
        lblCity.topToBottom(of: lblDesc, offset: 1)
        lblCity.edgesToSuperview(excluding: [.top], insets: UIEdgeInsets(top: 0, left: 8, bottom: 22, right: 8))
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let manager = DatabaseManager()
    
    func configurationLocationCellDetails(_ data: WeatherSearch) {
        lblTemp.text = data.temp
        ImageView.image = UIImage (named: data.img!)
        lblDesc.text = data.desc
        lblCity.text = data.city
        }
    enum Constant {
        enum URL {
            static let weatherImageUrl = "https://openweathermap.org/img/wn/"
        }
    }
    
}
