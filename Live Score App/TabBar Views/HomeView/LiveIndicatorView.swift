//
//  LiveIndicatorView.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 15.09.25.
//

import UIKit

class LiveIndicatorView: UIView {
    
    // MARK: - UI Components
    private let pulseLayer = CAShapeLayer()
    private let coreLayer = CAShapeLayer()
    private let liveLabel = UILabel()
    
    // MARK: - Animation Properties
    private var pulseAnimation: CAAnimationGroup?
    private var isAnimating = false
    
    // MARK: - Customization Properties
    var coreColor: UIColor = .systemGreen {
        didSet { updateColors() }
    }
    
    var pulseColor: UIColor = UIColor.systemGreen.withAlphaComponent(0.3) {
        didSet { updateColors() }
    }
    
    var animationDuration: TimeInterval = 1.5
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        backgroundColor = .clear
        
        // Setup live label
        liveLabel.text = "LIVE"
        liveLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        liveLabel.textColor = .systemGreen
        liveLabel.textAlignment = .center
        liveLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(liveLabel)
        
        // Setup layers
        layer.addSublayer(pulseLayer)
        layer.addSublayer(coreLayer)
        
        NSLayoutConstraint.activate([
            liveLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -12),
            liveLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateLayers()
    }
    
    private func updateLayers() {
        let center = CGPoint(x: bounds.width - 36, y: bounds.height / 2)
        let radius: CGFloat = 4
        
        // Core layer (solid dot)
        let corePath = UIBezierPath(arcCenter: center,
                                    radius: radius,
                                    startAngle: 0,
                                    endAngle: .pi * 2,
                                    clockwise: true)
        coreLayer.path = corePath.cgPath
        coreLayer.fillColor = coreColor.cgColor
        
        let pulseDiameter = radius * 2
        pulseLayer.frame = CGRect(x: center.x - radius,
                                  y: center.y - radius,
                                  width: pulseDiameter,
                                  height: pulseDiameter)
        pulseLayer.cornerRadius = radius
        pulseLayer.backgroundColor = pulseColor.cgColor
    }
    
    
    private func updateColors() {
        coreLayer.fillColor = coreColor.cgColor
        pulseLayer.strokeColor = pulseColor.cgColor
        liveLabel.textColor = coreColor
    }
    
    // MARK: - Animation Control
    func startAnimating() {
        guard !isAnimating else { return }
        isAnimating = true
        
        // Scale animation
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 1.0
        scaleAnimation.toValue = 2.5
        
        // Opacity animation
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1.0
        opacityAnimation.toValue = 0.0
        
        // Group animations
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [scaleAnimation, opacityAnimation]
        animationGroup.duration = animationDuration
        animationGroup.repeatCount = .infinity
        animationGroup.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        pulseLayer.add(animationGroup, forKey: "pulseAnimation")
        self.pulseAnimation = animationGroup
    }
    
    func stopAnimating() {
        guard isAnimating else { return }
        isAnimating = false
        
        pulseLayer.removeAnimation(forKey: "pulseAnimation")
        pulseAnimation = nil
    }
    
    // MARK: - Public Methods
    func setLive(_ isLive: Bool, animated: Bool = true) {
        if isLive {
            startAnimating()
            if animated {
                UIView.animate(withDuration: 0.3) {
                    self.alpha = 1.0
                }
            } else {
                alpha = 1.0
            }
        } else {
            stopAnimating()
            if animated {
                UIView.animate(withDuration: 0.3) {
                    self.alpha = 0.6
                }
            } else {
                alpha = 0.6
            }
        }
    }
}
