//
//  UsersTableViewCell.swift
//  TestProjectSaveleva
//
//  Created by Ekaterina Saveleva on 23.01.2024.
//

import UIKit


class UsersTableViewCell: UITableViewCell {
    
    static let identifire = "MyCell"
    
    lazy var avatarImageView: UIImageView = {
        var image = UIImageView(image: UIImage(named: "19"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.clipsToBounds = true
        return image
    }()
    
    lazy var labelUserName: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) { // момент создания ячеки блока с фотографиями
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        contentView.addSubview(avatarImageView)
        contentView.addSubview(labelUserName)
        
    }
    
    private func setupConstrains() {
        
        NSLayoutConstraint.activate([
            
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            avatarImageView.widthAnchor.constraint(equalToConstant: 30),
            avatarImageView.heightAnchor.constraint(equalToConstant: 20),
            
            labelUserName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            labelUserName.leadingAnchor.constraint(equalTo: avatarImageView.leftAnchor, constant: 20),
            
        ])
    }
}
