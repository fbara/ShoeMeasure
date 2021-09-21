//
//  MeasureShoeViewController.swift
//  ShoeMeasure
//
//  Created by Frank Bara on 9/20/21.
//

import UIKit
import SceneKit
import ARKit



class MeasureShoeViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var scnView: ARSCNView!
    
    func setupScene() {
        
        let scene = SCNScene()
        
        self.scnView.delegate = self
        self.scnView.showsStatistics = true
        self.scnView.automaticallyUpdatesLighting = true
        self.scnView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.scnView.scene = scene
    }
    
    func setupARSession() {
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = .horizontal
        scnView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }

    // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScene()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupARSession()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        scnView.session.pause()
    }
}
