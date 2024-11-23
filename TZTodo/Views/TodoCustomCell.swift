//
//  TodoCustomCell.swift
//  TZTodo
//
//  Created by Дмитрий Трушин on 23/11/2024.
//

import UIKit

final class TodoCustomCell: UITableViewCell {
    private lazy var checkBoxButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.yellow.cgColor
        button.backgroundColor = .clear
        button.tintColor = .yellow
        button.setImage(UIImage(systemName: "checkmark"), for: .selected)
        button.addTarget(self, action: #selector(toggleCheckmark), for: .touchUpInside)
        return button
    }()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let dateLebel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        setupConstrains()
        setupUI()
        updateDate()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        contentView.addSubviews(checkBoxButton, nameLabel, descriptionLabel, dateLebel)
    }
    
    private func setupConstrains() {
        checkBoxButton.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLebel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            checkBoxButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            checkBoxButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            checkBoxButton.widthAnchor.constraint(equalToConstant: 24),
            checkBoxButton.heightAnchor.constraint(equalToConstant: 24),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor, constant: 8),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            descriptionLabel.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            dateLebel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6),
            dateLebel.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor, constant: 8),
            dateLebel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    private func setupUI() {
        contentView.backgroundColor = .black
        
        nameLabel.text = "Новая задача"
        nameLabel.textColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        descriptionLabel.text = "Тестовый текст для новой задачи который будет растягиваться на несколько строк"
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 2
        
        dateLebel.text = "02/12/22"
        dateLebel.textColor = .gray
        dateLebel.font = UIFont.systemFont(ofSize: 12)
    }
    
    private func updateDate() {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        dateLebel.text = formatter.string(from: currentDate)
    }
    
    @objc private func toggleCheckmark() {
        checkBoxButton.isSelected.toggle()
    }
}
