// made by: Benjamin Hilderman
// made on: Jan 2018
// made for: ICS3U
// pong CPT

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
            let diffculiesScene = difficultyScene(size: self.size)
            self.view!.presentScene(diffculiesScene)
        }
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        
    }
    func didBegin(_ contact: SKPhysicsContact) {
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

class difficultyScene: SKScene {
    // Variables
    let singlePlayer = SKSpriteNode(imageNamed: "IMG_2606.PNG")
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        // The Background
        let mainMenuBackground = SKSpriteNode(imageNamed: "IMG_2579.PNG")
        self.backgroundColor = SKColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        mainMenuBackground.name = "Main Menu Background"
        mainMenuBackground.position = CGPoint(x: frame.size.width/2, y: frame.size.height / 2)
        self.addChild(mainMenuBackground) 
        mainMenuBackground.setScale(1)
        
        singlePlayer.name = "Single Player"
        singlePlayer.position = CGPoint(x: frame.size.width / 2 - 300 , y: frame.size.height/2)
        self.addChild(singlePlayer)
        singlePlayer.setScale(1.5)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        // Single Player difficulty
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "Single Player" {
                DIFIC = 0.06
                let mainGameScene = gameScene(size: self.size)
                self.view!.presentScene(mainGameScene)
                
            } 
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

class gameScene: SKScene , SKPhysicsContactDelegate {
    
    // Variables
    let ball = SKSpriteNode(imageNamed: "Ball.png")
    let userP = SKSpriteNode(imageNamed: "UserPaddle.jpg")
    let enemyP = SKSpriteNode(imageNamed: "BotPaddle.jpg")
    let enemyLabel = SKLabelNode(fontNamed: "arial")
    let userLabel = SKLabelNode(fontNamed: "arial")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 2)
    
    var enemyScore : Int = 0
    var userScore : Int = 0
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self 
        self.backgroundColor = SKColor(red: 0, green: 0, blue: 0, alpha: 0)
        let centerLine = SKSpriteNode(imageNamed: "CenterLine.png")
        
        self.addChild(centerLine) 
        centerLine.position = CGPoint(x: frame.size.width/2, y: frame.size.height / 2.35)
        centerLine.setScale(0.6)
        
        ball.name = "ball"
        ball.position = CGPoint(x: frame.size.height / 1, y: frame.size.width / 10)
        ball.setScale(0.031)
        ball.physicsBody = SKPhysicsBody(texture: ball.texture!, size: ball.size)
        
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.linearDamping = -0.03
        ball.physicsBody?.angularDamping = -0.03
        self.addChild(ball)
        
        // User Paddle
        userP.name = "user paddle"
        userP.physicsBody = SKPhysicsBody(rectangleOf: userP.size)
        userP.physicsBody!.isDynamic = false
        userP.physicsBody!.friction = 0
        userP.physicsBody!.restitution = 1
        userP.physicsBody!.linearDamping = 0
        userP.physicsBody?.isDynamic = false 
        userP.physicsBody?.affectedByGravity = false
        userP.position = CGPoint(x: frame.size.width - 100, y: (frame.size.height / 2))
        self.addChild(userP)
        userP.setScale(2)
        
        // Bot Paddle 
        enemyP.name = "enemy Paddle"
        enemyP.physicsBody = SKPhysicsBody(rectangleOf: enemyP.size)
        enemyP.physicsBody!.friction = 0
        enemyP.physicsBody!.restitution = 1
        enemyP.physicsBody!.linearDamping = 0
        enemyP.physicsBody?.isDynamic = false 
        enemyP.physicsBody?.affectedByGravity = false
        enemyP.position = CGPoint(x: 100 , y: (frame.size.height / 2))
        self.addChild(enemyP)
        enemyP.setScale(2)
        
        enemyLabel.text = " 0"
        enemyLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        enemyLabel.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        enemyLabel.fontSize = 70
        enemyLabel.position = CGPoint(x: frame.size.width / 2 - 80, y: frame.size.height - 80)
        self.addChild(enemyLabel)
        
        userLabel.text = "  0"
        userLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        userLabel.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        userLabel.fontSize = 70
        userLabel.position = CGPoint(x: frame.size.width / 2 + 80, y: frame.size.height - 80)
        self.addChild(userLabel)
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
        // Ball Moves
        ball.physicsBody?.applyImpulse(CGVector(dx: -5, dy: -5))
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        
        // Ball X Position
        enemyP.run(SKAction.moveTo(y: ball.position.y, duration: TimeInterval(DIFIC)))
        
        // When ball goes behind Users paddle
        if ball.position.x > userP.position.x + 70 {
            
            enemyP.position = CGPoint(x: 100 , y: (frame.size.height / 2))
            ball.position = CGPoint(x: frame.size.width / 2 , y: (frame.size.height / 2))
            ball.physicsBody?.velocity = CGVector(dx: -8, dy: -8)
            ball.physicsBody?.applyImpulse(CGVector(dx: -8, dy: -8))
            enemyScore += 1 
            enemyLabel.text = "" + String(enemyScore)
        }
        
        // When ball goes behind Bots paddle
        if ball.position.x < enemyP.position.x - 70 {
            
            enemyP.position = CGPoint(x: 100 , y: (frame.size.height / 2))
            ball.position = CGPoint(x: frame.size.width / 2 , y: (frame.size.height / 2))
            ball.physicsBody?.velocity = CGVector(dx: 8, dy: 8)
            ball.physicsBody?.applyImpulse(CGVector(dx: 8, dy: 8))
            userScore += 1 
            userLabel.text = "" + String(userScore)
            
        }
        //If bot wins
        if enemyScore >= 5 {
            ball.run(moveToNextSceneDelay) {
                let doneScene = GameOverScene(size: self.size)
                self.view!.presentScene(doneScene)
            }
        }
        //If user wins
        if userScore >= 5 { 
            ball.run(moveToNextSceneDelay) {
                let doneScene = GameOverScene1(size: self.size)
                self.view!.presentScene(doneScene)
                    
            }
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Finger moves user's paddle 
        for touch in touches {
            let location = touch.location(in: self)
            userP.run(SKAction.moveTo(y: location.y, duration: 0))
        }
    }
}

// User loses scene
class GameOverScene: SKScene {
    
    let menuButton = SKSpriteNode(imageNamed:"IMG_1020.PNG")
    let gameOverLabel = SKLabelNode(fontNamed: "Chalkduster")
    
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor(red: 1, green:1, blue:1, alpha: 1.0)
        
        menuButton.position = CGPoint(x: frame.size.width / 2, y: frame.size.height/2)
        menuButton.name = "menu button"
        self.addChild(menuButton)
        
        gameOverLabel.text = "You Lose"
        gameOverLabel.fontColor = #colorLiteral(red: 0.9254902005195618, green: 0.23529411852359772, blue: 0.10196078568696976, alpha: 1.0)
        gameOverLabel.fontSize = 80
        gameOverLabel.position = CGPoint(x: frame.size.width / 2, y: frame.size.height - 100)
        self.addChild(gameOverLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "menu button" {
                let diffculiesScene = difficultyScene(size: self.size)
                self.view!.presentScene(diffculiesScene)
            }
        }
    }
}

// User wins scene
class GameOverScene1: SKScene {
    
    let menuButton = SKSpriteNode(imageNamed:"IMG_1020.PNG")
    let gameOverLabel1 = SKLabelNode(fontNamed: "Chalkduster")
    
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor(red: 1, green:1, blue:1, alpha: 1.0)
        
        menuButton.position = CGPoint(x: frame.size.width / 2, y: frame.size.height/2)
        menuButton.name = "menu button"
        self.addChild(menuButton)
        
        gameOverLabel1.text = "You Win"
        gameOverLabel1.fontColor = #colorLiteral(red: 0.9254902005195618, green: 0.23529411852359772, blue: 0.10196078568696976, alpha: 1.0)
        gameOverLabel1.fontSize = 80
        gameOverLabel1.position = CGPoint(x: frame.size.width / 2, y: frame.size.height - 100)
        self.addChild(gameOverLabel1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "menu button" {
                let diffculiesScene = difficultyScene(size: self.size)
                self.view!.presentScene(diffculiesScene)
            }
        }
    }
}

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


