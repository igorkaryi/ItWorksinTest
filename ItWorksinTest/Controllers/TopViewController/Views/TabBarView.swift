//
//  TabBarView.swift
//  ItWorksinTest
//
//  Created by Igor Karyi on 04.08.2020.
//  Copyright © 2020 Igor Karyi. All rights reserved.
//

import UIKit

// MARK: - TabBarLabel

private class TabBarLabel: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = AppStyle.Color.darkBlue.value
        label.textAlignment = .center
        
        return label
    }()
    
    private let highlightedLine: UIView = {
        let view = UIView()
        view.backgroundColor = TabBarView.Config.bottomLineColor
        view.alpha = 0
        view.layer.cornerRadius = 2
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private(set) var isSelected = false
    
    // Constructors
    
    init(with text: String) {
        super.init(frame: .zero)
        
        addSubview(label)
        addSubview(highlightedLine)

        label.text = text
        
        isUserInteractionEnabled = true
        set(isSelected: false, animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
    
    // Layout
    
    override var intrinsicContentSize: CGSize {
        return label.intrinsicContentSize
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // configure label
        let labelSize = label.sizeThatFits(bounds.size)
        label.frame = CGRect(
            x: 0,
            y: labelSize.height,
            width: bounds.width,
            height: labelSize.height
        )
        
        // configure bottom line
        highlightedLine.frame = CGRect(
            x: 0,
            y: bounds.height - TabBarView.Config.bottomLineHeight,
            width: bounds.width,
            height: TabBarView.Config.bottomLineHeight
        )
    }
    
    func set(isSelected: Bool, animated: Bool) {
        self.isSelected = isSelected
        
        if animated {
            let anim = CATransition()
            anim.duration = CATransaction.animationDuration()
            anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            anim.type = .fade
            anim.isRemovedOnCompletion = true
            label.layer.add(anim, forKey: "fade")
        }
        
        let font = AppStyle.font(.helveticaNeue(isSelected ? .medium : .light), size: 13)

        label.textColor = AppStyle.Color.darkBlue.value
        label.font = font
    }

    // Highlighting control
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        update(isHighlighted: true, animated: true)
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        update(isHighlighted: false, animated: true)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        update(isHighlighted: false, animated: true)
    }
    
    private func update(isHighlighted: Bool, animated: Bool) {
        let alpha: CGFloat = isHighlighted ? 0.35 : 0

        let animBlock: () -> Void = { [unowned self] in
            self.highlightedLine.alpha = alpha
        }
        
        guard animated else {
            animBlock()
            return
        }
        
        let duration: TimeInterval = isHighlighted
            ? CATransaction.animationDuration() / 1.5
            : CATransaction.animationDuration()
        
        UIView.performAnimation(duration: duration, block: animBlock)
    }
    
}

// MARK: - TabBarView

@objc protocol TabBarViewDelegate: class {
    func tabBarView(_ tabbBarView: TabBarView, didSelect index: Int)
}

extension TabBarViewDelegate {
    func tabBarView(_ tabbBarView: TabBarView, didSelect index: Int) { }
}

//@IBDesignable
class TabBarView: UIControl {
    fileprivate enum Config {
        static let height = CGFloat(34)
        
        static let bottomLineHeight = CGFloat(2)
        static let bottomLineColor = AppStyle.Color.darkBlue.value
    }
    
    struct Item {
        var title: String
    }
    
    @IBOutlet weak var delegate: TabBarViewDelegate?
    
    // MARK: - Items
    
    fileprivate var labels = [TabBarLabel]() {
        didSet {
            oldValue.forEach { $0.removeFromSuperview() }
            labels.forEach { insertSubview($0, at: 0) }
        }
    }
    
    fileprivate var bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = Config.bottomLineColor
        
        return view
    }()
    
    // MARK: - Public properties
    
    override var intrinsicContentSize: CGSize {
        if let parent = superview {
            return CGSize(width: parent.bounds.width, height: Config.height)
        }
        
        let size = super.intrinsicContentSize
        return CGSize(width: size.width, height: Config.height)
    }
    
    fileprivate(set) var selectedIndex = 0
    
    // MARK: - Constructors & destructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialize()
    }
    
    private func initialize() {
        addSubview(bottomLine)
    }
    
    // MARK: - Public setters
    
    func set(items: [Item]) {
        if items.isEmpty {
            labels = []
            selectedIndex = -1
            return
        }
        
        // create labels
        labels = items.map {
            let label = TabBarLabel(with: $0.title)
            let tap = UITapGestureRecognizer(
                target: self,
                action: #selector(tabItemTap(_:))
            )
            label.addGestureRecognizer(tap)
            
            return label
        }
        
        selectedIndex = 0
        labels[selectedIndex].set(isSelected: true, animated: false)
        
        // update layout
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    func set(index: Int, animated: Bool) {
        assert(index >= 0)
        
        labels[index].set(isSelected: true, animated: animated)
        labels[selectedIndex].set(isSelected: false, animated: animated)
        
        selectedIndex = index
        
        if animated {
            UIView.performAnimation(duration: CATransaction.animationDuration(), block: {
                self.setNeedsLayout()
                self.layoutIfNeeded()
            })
        }
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let itemSize = CGSize(
            width: itemWidth(count: labels.count),
            height: bounds.height
        )
        
        // update items position
        for (idx, label) in labels.enumerated() {
            let frame = CGRect(
                x: CGFloat(idx) * itemSize.width,
                y: 0,
                width: itemSize.width,
                height: itemSize.height
            )
            
            label.frame = frame
        }
        
        // update bottom line
        bottomLine.frame = CGRect(
            x: itemSize.width * CGFloat(selectedIndex),
            y: itemSize.height - Config.bottomLineHeight,
            width: itemSize.width,
            height: Config.bottomLineHeight
        )
    }
    
}

private extension TabBarView {

    func itemWidth(count: Int) -> CGFloat {
        return floor(bounds.width / CGFloat(count))
    }
    
    @objc
    func tabItemTap(_ sender: UITapGestureRecognizer) {
        let label = sender.view as! TabBarLabel
        let idx = labels.firstIndex(of: label)!
        
        if idx != selectedIndex {
            set(index: idx, animated: true)
            
            delegate?.tabBarView(self, didSelect: idx)
        }
    }
    
}
