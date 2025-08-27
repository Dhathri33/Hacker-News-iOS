import UIKit

class NewsTableCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var titleOfThePost: UILabel!
    @IBOutlet weak var postDetails: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var numberOfComments: UILabel!
}

//MARK: Helper functions

extension NewsTableCell {
    func loadCellData(news: News){
        titleOfThePost.text = news.title
        postDetails.text = "\(news.author ?? " ") . \(news.created_at ?? " ") . by \(news.author ?? " ")"
        points.text = "\(news.points ?? 0)"
        numberOfComments.text = "\(news.num_comments ?? 0)"
    }
}
