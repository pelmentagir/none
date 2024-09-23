//
//  UserTableViewCell.swift
//  lesson3
//
//  Created by Тагир Файрушин on 22.09.2024.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rightSlideLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        avatarImageView.image = nil
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with user: User) {
        
        avatarImageView.image = user.avatarImage
        titleLabel.text = user.name
        subtitleLabel.text = user.lastName
        rightSlideLabel.text = user.age
    }
    
    private func setupLayout() {
        guard avatarImageView.superview == nil else {return }
        
        let mainStackView = UIStackView(arrangedSubviews: [titleLabel,subtitleLabel])
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(avatarImageView)
        contentView.addSubview(mainStackView)
        contentView.addSubview(rightSlideLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: 30),
            avatarImageView.widthAnchor.constraint(equalToConstant: 30),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            rightSlideLabel.leadingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            rightSlideLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            rightSlideLabel.centerYAnchor.constraint(equalTo: mainStackView.centerYAnchor)
        ])
    }
}
extension UserTableViewCell{
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
