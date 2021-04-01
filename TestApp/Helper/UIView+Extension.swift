
import UIKit


extension UIView {
    @objc final func fillToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            let left = leftAnchor.constraint(equalTo: superview.leftAnchor)
            let right = rightAnchor.constraint(equalTo: superview.rightAnchor)
            let top = topAnchor.constraint(equalTo: superview.topAnchor)
            let bottom = bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            NSLayoutConstraint.activate([left, right, top, bottom])
        }
    }
    
    func addEqualWidthConstraintBetween(item1: UIView, item2: UIView) {
        let constraint : NSLayoutConstraint! = NSLayoutConstraint(item: item1, attribute: .width, relatedBy: .equal, toItem: item2, attribute: .width, multiplier: 1, constant: 0)
        self.addConstraint(constraint)
    }
    
    func removeAllSubview() {
        for sView in self.subviews {
            sView.removeFromSuperview()
        }
    }
}

