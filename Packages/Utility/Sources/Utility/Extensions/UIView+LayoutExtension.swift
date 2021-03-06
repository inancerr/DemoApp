
import class UIKit.UIView
import struct UIKit.CGFloat
import class UIKit.NSLayoutConstraint
import class UIKit.NSLayoutDimension
import class UIKit.NSLayoutYAxisAnchor

// MARK: - Align Edge
public extension UIView {
    @discardableResult
    func alignFitEdges(insetedBy: CGFloat = .zero) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            leadingAnchor.constraint(
                equalTo: superview!.leadingAnchor,
                constant: insetedBy
            ),
            trailingAnchor.constraint(
                equalTo: superview!.trailingAnchor,
                constant: -insetedBy
            ),
            topAnchor.constraint(
                equalTo: superview!.topAnchor,
                constant: insetedBy
            ),
            bottomAnchor.constraint(
                equalTo: superview!.bottomAnchor,
                constant: -insetedBy
            )
        ]
        return constraints
    }
    
    @discardableResult
    func alignEdges(
        leading: CGFloat = .zero,
        trailing: CGFloat = .zero,
        top: CGFloat = .zero,
        bottom: CGFloat = .zero
    ) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            leadingAnchor.constraint(
                equalTo: superview!.leadingAnchor,
                constant: leading
            ),
            trailingAnchor.constraint(
                equalTo: superview!.trailingAnchor,
                constant: trailing
            ),
            topAnchor.constraint(
                equalTo: superview!.topAnchor,
                constant: top
            ),
            bottomAnchor.constraint(
                equalTo: superview!.bottomAnchor,
                constant: bottom
            )
        ]
        return constraints
    }
}

// MARK: - Align Directions
public extension UIView {
    @discardableResult
    func alignLeading(
        to view: UIView,
        offset: CGFloat = .zero
    ) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let isSuperviewRelation = view == superview
        let anchor = isSuperviewRelation
            ? view.leadingAnchor
            : view.trailingAnchor
        
        let constraint = leadingAnchor.constraint(
            equalTo: anchor,
            constant: offset
        )
        return constraint
    }
    
    @discardableResult
    func alignTrailing(
        to view: UIView,
        offset: CGFloat = .zero
    ) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let isSuperviewRelation = view == superview
        let anchor = isSuperviewRelation
            ? view.trailingAnchor
            : view.leadingAnchor
        
        let constraint = trailingAnchor.constraint(
            equalTo: anchor,
            constant: offset
        )
        return constraint
    }
        
    @discardableResult
    func alignTop(
        to view: UIView,
        offset: CGFloat = .zero
    ) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let isSuperviewRelation = view == superview
        let anchor = isSuperviewRelation
            ? view.topAnchor
            : view.bottomAnchor
        
        let constraint = topAnchor.constraint(
            equalTo: anchor,
            constant: offset
        )
        return constraint
    }
    
    @discardableResult
    func alignBottom(
        to view: UIView,
        offset: CGFloat = .zero
    ) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let isSuperviewRelation = view == superview
        let anchor = isSuperviewRelation
            ? view.bottomAnchor
            : view.topAnchor
        
        let constraint = bottomAnchor.constraint(
            equalTo: anchor,
            constant: offset
        )
        return constraint
    }
    
    @discardableResult
    func alignTop(
        to anchor: NSLayoutYAxisAnchor,
        offset: CGFloat = .zero
    ) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = topAnchor.constraint(
            equalTo: anchor,
            constant: offset
        )
        return constraint
    }
}

// MARK: - Sizing
public extension UIView {
    @discardableResult
    func alighWidth(
        _ constant: CGFloat
    ) -> NSLayoutConstraint {
        sizeWith(widthAnchor, constant: constant)
    }
    
    @discardableResult
    func alignHeight(
        _ constant: CGFloat
    ) -> NSLayoutConstraint {
        sizeWith(heightAnchor, constant: constant)
    }
    
    @discardableResult
    func alignSize(
        width: CGFloat,
        height: CGFloat
    ) -> [NSLayoutConstraint] {
        let widthConstraint = sizeWith(widthAnchor, constant: width)
        let heightConstraint = sizeWith(heightAnchor, constant: height)
        let constraints = [widthConstraint, heightConstraint]
        return constraints
    }
    
    @discardableResult
    func equalWidth(
        with view: UIView,
        difference: CGFloat = .zero
    ) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        return widthAnchor.constraint(
            equalTo: view.widthAnchor,
            constant: difference
        )
    }
    
    @discardableResult
    func equalHeight(
        with view: UIView,
        difference: CGFloat = .zero
    ) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        return heightAnchor.constraint(
            equalTo: view.heightAnchor,
            constant: difference
        )
    }
}

// MARK: - Internal Workers
public extension UIView {
    func sizeWith(
        _ dimension: NSLayoutDimension,
        constant: CGFloat
    ) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = dimension.constraint(
            equalToConstant: constant
        )
        return constraint
    }
}

// MARK: - Activation
public extension Array where Element == NSLayoutConstraint {
    func activate() {
        NSLayoutConstraint.activate(self)
    }
}

public extension NSLayoutConstraint {
    func activate() {
        NSLayoutConstraint.activate([self])
    }
}
