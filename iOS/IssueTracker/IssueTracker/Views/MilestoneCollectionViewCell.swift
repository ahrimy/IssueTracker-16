//
//  MilestoneCollectionViewCell.swift
//  IssueTracker
//
//  Created by 홍경표 on 2020/10/28.
//

import UIKit

class MilestoneCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static var identifier: String {
        String(describing: self)
    }
    @IBOutlet weak var milestoneName: UILabel!
    @IBOutlet weak var milestoneDescription: UILabel!
    @IBOutlet weak var milestoneDueDate: UILabel!
    @IBOutlet weak var milestonePercent: UILabel!
    @IBOutlet weak var milestoneOpenIssues: UILabel!
    @IBOutlet weak var milestoneClosedIssues: UILabel!
    
    // MARK: - Methods
    
    func configure(milestone: Milestone) {
        milestoneName.text = milestone.title
        milestoneDescription.text = milestone.description
        milestoneOpenIssues.text = "\(milestone.openedIssues) open"
        milestoneClosedIssues.text = "\(milestone.closedIssues) closed"
        let percent = milestone.closedIssues != 0 ? Int(round(Float(milestone.openedIssues) / Float(milestone.openedIssues + milestone.closedIssues) * 100.0)) : 0
        milestonePercent.text = "\(percent)%"
        if let dueDate = milestone.dueDate, !dueDate.isEmpty {
            let formattedDate: String = {
                let arr = dueDate.components(separatedBy: "-")
                return "\(arr[0])년 \(arr[1])월 \(arr[2])일"
            }()
            milestoneDueDate.text = formattedDate
        } else {
            milestoneDueDate.text = ""
        }
    }
}