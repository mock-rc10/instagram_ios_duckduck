//
//  UINavigationItem.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/08.
//

import UIKit

extension UINavigationItem{

    func makeSFSymbolButton(_ target: Any?, action: Selector, symbolName: String) -> UIBarButtonItem{
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: symbolName), for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.tintColor = .black
        
        let barButtonItem = UIBarButtonItem(customView: button)
        barButtonItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        barButtonItem.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        barButtonItem.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        return barButtonItem
    }
    func makeSFSymbolLogoButton(_ target: Any?,action: Selector, symbolName: String) -> UIBarButtonItem{
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: symbolName), for: .normal)
        button.addTarget(target, action:action, for: .touchUpInside)
        button.tintColor = .black
        
        let barButtonItem = UIBarButtonItem(customView: button)
        barButtonItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        barButtonItem.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        barButtonItem.customView?.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        return barButtonItem
    }
    func makeSFSymbolWhiteButton(_ target: Any?,action: Selector, symbolName: String) -> UIBarButtonItem{
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: symbolName), for: .normal)
        button.addTarget(target, action:action, for: .touchUpInside)
        button.tintColor = .white
        
        let barButtonItem = UIBarButtonItem(customView: button)
        barButtonItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        barButtonItem.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        barButtonItem.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        return barButtonItem
    }
    func makeLabel(title: String) -> UIBarButtonItem {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        let barButtonItem = UIBarButtonItem.init(customView: titleLabel)
        return barButtonItem
    }
    func makeWhiteLabel(title: String) -> UIBarButtonItem {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.white
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        let barButtonItem = UIBarButtonItem.init(customView: titleLabel)
        return barButtonItem
    }
}
