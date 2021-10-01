//
//  ListTableViewCell.swift
//  RxSwift_TodoList
//
//  Created by 黃瀞萱 on 2021/10/1.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()

    private lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "check"), for: .selected)
        button.setImage(UIImage(named: "uncheck"), for: .normal)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        checkButton.isSelected = false
    }
}

extension ListTableViewCell {
    private func setupSubViews() {
        selectionStyle = .none
        
        [titleLabel, checkButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        [titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
         titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
         titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
         
         checkButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
         checkButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
         checkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ].forEach{ $0.isActive = true }
    }
    
//    func layoutCell(task: Task) {
//        titleLabel.text = task.title
//        checkButton.isSelected = task.checked
//    }
}
