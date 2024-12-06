//
//  SavedItemViewCell.swift
//  A4
//
//  Created by Aidan Joseph on 12/6/24.
//
import UIKit
import SnapKit

class SavedItemCell: UICollectionViewCell {
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let bookmarkImage = UIImageView()
    static let reuse = "SavedItemCellReuse"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 0

        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)

        titleLabel.font = .systemFont(ofSize: 14)
        addSubview(titleLabel)
        
        bookmarkImage.image = UIImage(named: "bookmarked")
        addSubview(bookmarkImage)

        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
            make.width.equalTo(80)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.leading).inset(8)
            make.centerY.equalToSuperview()
        }
        
        bookmarkImage.snp.makeConstraints{ make in
            make.width.height.equalTo(20)
            make.trailing.top.equalToSuperview().inset(8)
        }
    }

    func configure(with item: String) {
        titleLabel.text = item
        imageView.image = UIImage(named: "\(item.lowercased())_icon")
    }
}
