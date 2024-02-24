//
//  Cells.swift
//  Notes
//
//  Created by Руслан Канжарбеков on 24.02.2024.
//

import UIKit
import SnapKit

class NoteCollectionViewCell: UICollectionViewCell {
    
    static var reuseID = "note_cell"
    
    let colors : [UIColor] = [.systemPink, .cyan, .systemOrange, .systemGreen]
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        layer.cornerRadius = 10
        backgroundColor = colors.randomElement()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(title: String) {
        titleLabel.text = title
    }
    
    private func setupLayout() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.left.right.equalToSuperview().inset(10)
        }
    }
}

class NoteTableViewCell: UITableViewCell {
    
    static let reuseID = "note_cell"
    
    private lazy var settingImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var settingTitleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.preferredFont(forTextStyle: .body)
        view.textColor = UIColor.label
        return view
    }()
    
    var button: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "Chevron"), for: .normal)
        view.setTitle("Русский", for: .normal)
        view.setTitleColor(.secondaryLabel, for: .normal)
        view.tintColor = .black
        view.semanticContentAttribute = .forceRightToLeft
        view.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -15)
        return view
    }()

    var switchButton: UISwitch = {
        let view = UISwitch()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(settingImageView)
        contentView.addSubview(settingTitleLabel)
        contentView.addSubview(button)
        contentView.addSubview(switchButton)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        settingImageView.image = nil
        settingTitleLabel.text = nil
    }
    
    func setup(title: String) {
        settingTitleLabel.text = title
    }
    
    func setup(image: UIImage) {
        settingImageView.image = image
    }
    
    private func setupLayout() {
        settingImageView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).offset(16)
            make.width.height.equalTo(24)
        }
        
        settingTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(settingImageView.snp.trailing).offset(13)
        }
        
        button.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView).offset(-25)
        }
        
        switchButton.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView).offset(-25)
        }
    }
}