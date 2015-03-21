import UIKit

class AnimationWithClosures {
    func animate(scale: (Void) -> Void, bounce: (Void) -> Void) {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            scale()
            })
            { (success) -> Void in
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    bounce()
                })
        }
    }
}

