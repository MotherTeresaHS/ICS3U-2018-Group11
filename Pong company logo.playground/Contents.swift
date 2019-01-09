// made by: Benjamin Hilderman
// made on: Jan 2018
// Created for: ICS3U
// pong

import PlaygroundSupport
import SpriteKit
var DIFIC : Double = 0 

class SplashScene: SKScene, SKPhysicsContactDelegate {
    // Variables
    let moveToNextSceneDelay = SKAction.wait(forDuration: 1)
    
    override func didMove(to view: SKView) {
        
        // Background
        let SplashSceneBackground = SKSpriteNode(imageNamed: "IMG_1028.PNG")
        self.backgroundColor = SKColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        SplashSceneBackground.name = "Splash scene background"
        SplashSceneBackground.position = CGPoint(x: frame.size.width/2.2, y: frame.size.height / 2.8)
        self.addChild(SplashSceneBackground) 
        SplashSceneBackground.setScale(0.5)
        
        SplashSceneBackground.run(moveToNextSceneDelay) {
            let companyyScene = companyScene(size: self.size)
            self.view!.presentScene(companyyScene)
            
        }
        
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
}

class companyScene: SKScene, SKPhysicsContactDelegate {
    // Variables
    let moveToNextSceneDelay = SKAction.wait(forDuration: 3)
    
    override func didMove(to view: SKView) {
        
        // Background
        let companyLogo = SKSpriteNode(imageNamed: "IMG_2605.PNG")
        self.backgroundColor = SKColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        companyLogo.name = "company logo"
        companyLogo.position = CGPoint(x: frame.size.width/2.2, y: frame.size.height / 2.8)
        self.addChild(companyLogo) 
        companyLogo.setScale(0.3)
            
        }
        
        
    }
    
    func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }



// this will be commented out when code moved to Xcode
// set the frame to be the size for your iPad
let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)

let scene = SplashScene(size: frame.size)
scene.scaleMode = SKSceneScaleMode.resizeFill

let skView = SKView(frame: frame)
skView.showsFPS = true
skView.presentScene(scene)

PlaygroundPage.current.liveView = skView


