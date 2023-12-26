//
//  ViewController.swift
//  ARRuler
//
//  Created by Amrinder Singh on 12/5/23.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    var dotNodes = [SCNNode]()
    var textNode = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        
        
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        
        
        
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch detected")
        
        if dotNodes.count >= 2 {
            
                        for dot in dotNodes {
                            dot.removeFromParentNode()
                        }
            
            dotNodes = [SCNNode]()
            
        }
      
        
        
        
        
        
        
        
        
        if let touch = touches.first{
            print("did")
            
            let touchLoaction = touch.location(in: sceneView)
            
            let  query =  sceneView.raycastQuery(from: touchLoaction, allowing: .existingPlaneInfinite, alignment: .any)
            
            let results = sceneView.session.raycast(query!)
            
            if let hitResult = results.first {
                print("did2")
                addDot(at: hitResult)
            }
            
        }
        
        
        
    }
    
    func  addDot(at hitResult : ARRaycastResult){
        let Dot = SCNSphere(radius: 0.005)
        let material = SCNMaterial()
        
        material.diffuse.contents = UIColor.red
        
        Dot.materials = [material]
        
        let node = SCNNode(geometry: Dot)
        
        node.position = SCNVector3(
            x:hitResult.worldTransform.columns.3.x,
            y: hitResult.worldTransform.columns.3.y,
            z: hitResult.worldTransform.columns.3.z)
        
        
        sceneView.scene.rootNode.addChildNode(node)
        
        dotNodes.append(node)
        
        if dotNodes.count >= 2{
            calculate()
        }
        
    }
    
    func calculate()  {
        let start = dotNodes[0]
        let end = dotNodes[1]
        
        print(start.position)
        print(end.position)
        // formula for finding distance between to points ____
        let a = end.position.x - start.position.x
        let b = end.position.y - start.position.y
        let c =  end.position.z - start.position.z
        let distance = sqrt(pow(a, 2) + pow(b, 2) + pow(c, 2))
        
        updateText(text: "\(distance)",atPosition: end.position)
        
        
        
    }
    func updateText(text:String ,atPosition position: SCNVector3)  {
        
        textNode.removeFromParentNode()
        
        
        let textGeometry = SCNText(string: text, extrusionDepth: 1.0)
        
        textGeometry.firstMaterial?.diffuse.contents = UIColor.white
        
        textNode = SCNNode(geometry: textGeometry)
        
        textNode.position = SCNVector3(x: position.x, y: position.y+0.01, z: position.z)
        
        textNode.scale = SCNVector3(x: 0.001, y: 0.001, z: 0.001)
        
        sceneView.scene.rootNode.addChildNode(textNode)
       
        
    }
    
    

}


