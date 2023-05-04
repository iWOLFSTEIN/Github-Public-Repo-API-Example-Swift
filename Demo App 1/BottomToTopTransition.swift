//
//  BottomToTopTransition.swift
//  Demo App 1
//
//  Created by BrainX Technologies on 04/05/2023.
//

import UIKit

class BottomToTopTransition: UIStoryboardSegue {
    override func perform() {
        // Get the source and destination view controllers
        let source = self.source
        let destination = self.destination

        // Create a transition animation
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop

        // Add the transition animation to the navigation controller's view
        source.navigationController?.view.layer.add(transition, forKey: kCATransition)

        // Push the destination view controller onto the navigation stack
        source.navigationController?.pushViewController(destination, animated: false)
    }

}
