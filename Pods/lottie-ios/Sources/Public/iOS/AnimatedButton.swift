//
//  AnimatedButton.swift
//  lottie-swift
//
//  Created by Brandon Withrow on 2/4/19.
//

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS) || targetEnvironment(macCatalyst)
import UIKit
/**
 An interactive button that plays an animation when pressed.
 */
open class AnimatedButton: AnimatedControl {

  // MARK: Lifecycle

  public override init(animation: Animation) {
    super.init(animation: animation)
    accessibilityTraits = UIAccessibilityTraits.button
  }

  public override init() {
    super.init()
    accessibilityTraits = UIAccessibilityTraits.button
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  // MARK: Public

  /// Sets the play range for the given UIControlEvent.
  public func setPlayRange(fromProgress: AnimationProgressTime, toProgress: AnimationProgressTime, events: UIControl.Event) {
    rangesForEvents[events.rawValue] = (from: fromProgress, to: toProgress)
  }

  /// Sets the play range for the given UIControlEvent.
  public func setPlayRange(fromMarker fromName: String, toMarker toName: String, events: UIControl.Event) {
    if
      let start = animationView.progressTime(forMarker: fromName),
      let end = animationView.progressTime(forMarker: toName)
    {
      rangesForEvents[events.rawValue] = (from: start, to: end)
    }
  }

  public override func beginTracking(_ touch: UITouch, with events: UIEvent?) -> Bool {
    let _ = super.beginTracking(touch, with: events)
    let touchEvent = UIControl.Event.touchDown
    if let playrange = rangesForEvents[touchEvent.rawValue] {
      animationView.play(fromProgress: playrange.from, toProgress: playrange.to, loopMode: LottieLoopMode.playOnce)
    }
    return true
  }

  public override func endTracking(_ touch: UITouch?, with events: UIEvent?) {
    super.endTracking(touch, with: events)
    let touchEvent: UIControl.Event
    if let touch = touch, bounds.contains(touch.location(in: self)) {
      touchEvent = UIControl.Event.touchUpInside
    } else {
      touchEvent = UIControl.Event.touchUpOutside
    }

    if let playrange = rangesForEvents[touchEvent.rawValue] {
      animationView.play(fromProgress: playrange.from, toProgress: playrange.to, loopMode: LottieLoopMode.playOnce)
    }
  }

  // MARK: Fileprivate

  fileprivate var rangesForEvents: [UInt : (from: CGFloat, to: CGFloat)] =
    [UIControl.Event.touchUpInside.rawValue : (from: 0, to: 1)]
}
#endif
