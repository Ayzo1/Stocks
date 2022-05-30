import UIKit

class StockTableViewCell: UITableViewCell {
	
	static let identifirer = String(describing: StockTableViewCell.self)

	private lazy var generalTextLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = Constants.textColor
		label.font = .boldSystemFont(ofSize: 15)
		label.lineBreakMode = .byTruncatingTail
		label.textAlignment = .left
		return label
	}()
	
	private lazy var secondaryTextLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = Constants.secondaryTextColor
		label.textAlignment = .right
		return label
	}()
	
	func configurateCell(generalText: String, secondaryText: String) {
		contentView.backgroundColor = Constants.secondBackgroundColor
		generalTextLabel.text = generalText
		secondaryTextLabel.text = secondaryText
		contentView.addSubview(secondaryTextLabel)
		setupSecondaryLabel()
		contentView.addSubview(generalTextLabel)
		setupGeneralLabel()
	}
	
	override func prepareForReuse() {
		generalTextLabel.text = ""
		secondaryTextLabel.text = ""
	}
	
	private func setupGeneralLabel() {
		//generalTextLabel.heightAnchor.constraint(equalToConstant: 60.5).isActive = true
		generalTextLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 15).isActive = true
		generalTextLabel.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: -15).isActive = true
		generalTextLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
		generalTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
		generalTextLabel.trailingAnchor.constraint(lessThanOrEqualTo: secondaryTextLabel.leadingAnchor, constant: -10).isActive = true
	}
	
	private func setupSecondaryLabel() {
		secondaryTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
		secondaryTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
		secondaryTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
		secondaryTextLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
		secondaryTextLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
	}
}
