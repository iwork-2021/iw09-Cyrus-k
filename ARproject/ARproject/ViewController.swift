//
//  ViewController.swift
//  ARproject
//
//  Created by nju on 2022/1/7.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    var tankAnchor: TinyToyTank._TinyToyTank?
    var isActionPlaying: Bool = false
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        //let boxAnchor = try! Experience.loadBox()
        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        // Add the box anchor to the scene
        //arView.scene.anchors.append(boxAnchor)
        tankAnchor?.actions.actionComplete.onAction = { _ in
          self.isActionPlaying = false
        }
        tankAnchor!.turret?.setParent(
          tankAnchor!.tank, preservingWorldTransform: true)

        arView.scene.anchors.append(tankAnchor!)
    }
    @IBAction func TurretLeftPressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        tankAnchor!.notifications.turretLeft.post()

    }
    @IBAction func CannonFIrePressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        tankAnchor!.notifications.cannonFire.post()

    }
    @IBAction func TurretRightPressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        tankAnchor!.notifications.turretRight.post()

    }
    @IBAction func TankLeftPressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        tankAnchor!.notifications.tankLeft.post()
    }
    @IBAction func TankForwardPressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        tankAnchor!.notifications.tankForward.post()
    }
    @IBAction func TankRightPressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        tankAnchor!.notifications.tankRight.post()

    }
}
