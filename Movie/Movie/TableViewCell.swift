

import UIKit

class TableViewCell: UITableViewCell {
    
    var titleLabelText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var descLabelText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(titleLabelText)
        contentView.addSubview(descLabelText)
        
       
        titleLabelText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        titleLabelText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        titleLabelText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        
        descLabelText.topAnchor.constraint(equalTo: titleLabelText.bottomAnchor, constant: 8).isActive = true
        descLabelText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        descLabelText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        descLabelText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        
        
        titleLabelText.font = UIFont.systemFont(ofSize: 18)
        descLabelText.font = UIFont.systemFont(ofSize: 14)
        descLabelText.textColor = UIColor.gray
        descLabelText.numberOfLines = 0
        titleLabelText.textAlignment = .center
        titleLabelText.numberOfLines = 0
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
