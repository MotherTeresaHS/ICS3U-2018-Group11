// made by: Benjamin Hilderman
// made on: Jan 2018
// made for: ICS3U
// pong CPT

import PlaygroundSupport
import SpriteKit
var DIFIC : Double = 0 

class SplashScene: SKScene, SKPhysicsContactDelegate {
    // Variables
    let moveToNextScene = SKAction.wait(forDuration: 1)
    
    override func didMove(to view: SKView) {
        // Background
        let SplashSceneBackground = SKSpriteNode(imageNamed: "IMG_1028.PNG")
        self.backgroundColor = SKColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        SplashSceneBackground.name = "Splash scene background"
        SplashSceneBackground.position = CGPoint(x: frame.size.width/2.2, y: frame.size.height / 2.8)
        self.addChild(SplashSceneBackground) 
        SplashSceneBackground.setScale(0.5)
        SplashSceneBackground.run(moveToNextScene) {
            let menuScene = mainMenuScene(size: self.size)
            self.view!.presentScene(menuScene)
            
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

class mainMenuScene: SKScene {
    // Variables
    let singlePlayer = SKSpriteNode(imageNamed: "IMG_2606.PNG")
    let settingsButton = SKSpriteNode(imageNamed: "IMG_2608.PNG")
    
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
        singlePlayer.position = CGPoint(x: 450, y: 245)
        self.addChild(singlePlayer)
        singlePlayer.setScale(0.17)
        
        settingsButton.name = "Settings Button"
        settingsButton.position = CGPoint(x: frame.size.width / 5  , y: frame.size.height/5)
        self.addChild(settingsButton )
        settingsButton.setScale(0.05)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        // Level 1 difficulty
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "Single Player" {
                DIFIC = 0.3
                let mainGameScene = gameScene(size: self.size)
                self.view!.presentScene(mainGameScene)
                
            } 
            
            if touchedNodeName == "Settings Button" {
                let mainGameScene = instructionsScene(size: self.size)
                self.view!.presentScene(mainGameScene)
            }
        }
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}

class instructionsScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let backButton = SKSpriteNode(imageNamed: "BackButton.png")
    let firstLineLabel : UILabel = UILabel()
    let secondLineLabel : UILabel = UILabel()
    let titleLabel : UILabel = UILabel()
    
    override func didMove(to view: SKView) {
        // this will run when the scene loads
        
        self.backgroundColor = SKColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        backButton.position = CGPoint(x: 100, y: 70)
        backButton.name = "backbutton"
        self.addChild(backButton)
        backButton.setScale(0.05)
        
        titleLabel.text = "Instructions"
        titleLabel.textColor =  _ColorLiteralType(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabel.font = titleLabel.font.withSize(80)
        
        
        firstLineLabel.text = "Compete against the bot controlling the paddle on the right side. The goal of this game is to use your paddle to hit the"
        firstLineLabel.textColor =  _ColorLiteralType(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(firstLineLabel)
        firstLineLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLineLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        firstLineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        secondLineLabel.text = "ball back to your opponent. Points are earned when one fails to return the ball to the other. To win you need six points."
        secondLineLabel.textColor =  _ColorLiteralType(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(secondLineLabel)
        secondLineLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLineLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        secondLineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    override func  update(_ currentTime: TimeInterval) {
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var nodeTouched = self.atPoint(location)
        
        
        if let nodeTouchedName = nodeTouched.name{
            if nodeTouchedName == "backbutton" {
                titleLabel.text = ""
                firstLineLabel.text = ""
                secondLineLabel.text = ""
                let instructionsScene = mainMenuScene(size: self.size)
                self.view!.presentScene(instructionsScene)
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
    let playerPaddle = SKSpriteNode(imageNamed: "UserPaddle.jpg")
    let botPaddle = SKSpriteNode(imageNamed: "BotPaddle.jpg")
    let botLabel = SKLabelNode(fontNamed: "Markerfelt-wide")
    let userLabel = SKLabelNode(fontNamed: "Markerfelt-wide")
    let moveToNextScene = SKAction.wait(forDuration: 2)
    
    var botScore : Int = 0
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
        playerPaddle.name = "user paddle"
        playerPaddle.physicsBody = SKPhysicsBody(rectangleOf: playerPaddle.size)
        playerPaddle.physicsBody!.friction = 0
        playerPaddle.physicsBody!.restitution = 1
        playerPaddle.physicsBody!.linearDamping = 0
        playerPaddle.physicsBody?.isDynamic = false 
        playerPaddle.physicsBody?.affectedByGravity = false
        playerPaddle.position = CGPoint(x: 150, y: (frame.size.height / 2))
        self.addChild(playerPaddle)
        playerPaddle.setScale(2)
        
        // Bot Paddle 
        botPaddle.name = "enemy Paddle"
        botPaddle.physicsBody = SKPhysicsBody(rectangleOf: botPaddle.size)
        botPaddle.physicsBody!.friction = 0
        botPaddle.physicsBody!.restitution = 1
        botPaddle.physicsBody!.linearDamping = 0
        botPaddle.physicsBody?.isDynamic = false 
        botPaddle.physicsBody?.affectedByGravity = false
        botPaddle.position = CGPoint(x: frame.size.width - 150, y: (frame.size.height / 2))
        self.addChild(botPaddle)
        botPaddle.setScale(2)
        
        botLabel.text = " 0"
        botLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        botLabel.fontColor =  _ColorLiteralType(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        botLabel.fontSize = 70
        botLabel.position = CGPoint(x: frame.size.width / 2 + 80, y: frame.size.height - 80)
        self.addChild(botLabel)
        
        userLabel.text = "  0"
        userLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        userLabel.fontColor =  _ColorLiteralType(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        userLabel.fontSize = 70
        userLabel.position = CGPoint(x: frame.size.width / 2 - 80, y: frame.size.height - 80)
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
        botPaddle.run(SKAction.moveTo(y: ball.position.y, duration: TimeInterval(DIFIC)))
        
        // When ball goes behind Users paddle
        if ball.position.x > botPaddle.position.x + 70 {
            playerPaddle.position = CGPoint(x: 100 , y: (frame.size.height / 2))
            ball.position = CGPoint(x: frame.size.width / 2 , y: (frame.size.height / 2))
            ball.physicsBody?.velocity = CGVector(dx: -8, dy: -8)
            ball.physicsBody?.applyImpulse(CGVector(dx: -8, dy: -8))
            userScore += 1 
            userLabel.text = "" + String(userScore)
            
        }
        
        // When ball goes behind Bots paddle
        if ball.position.x < playerPaddle.position.x - 70 {
            playerPaddle.position = CGPoint(x: 100 , y: (frame.size.height / 2))
            ball.position = CGPoint(x: frame.size.width / 2 , y: (frame.size.height / 2))
            ball.physicsBody?.velocity = CGVector(dx: 8, dy: 8)
            ball.physicsBody?.applyImpulse(CGVector(dx: 8, dy: 8))
            botScore += 1 
            botLabel.text = "" + String(botScore)
            
        }
        //If bot wins
        if botScore >= 6 {
            ball.run(moveToNextScene) {
                let doneScene = youLoseScene(size: self.size)
                self.view!.presentScene(doneScene)
            }
        }
        //If user wins
        if userScore >= 6 { 
            ball.run(moveToNextScene) {
                let doneScene = youWinScene(size: self.size)
                self.view!.presentScene(doneScene)
                
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Finger moves user's paddle 
        for touch in touches {
            let location = touch.location(in: self)
            playerPaddle.run(SKAction.moveTo(y: location.y, duration: 0))
            
        }
        
    }
    
}
// User loses scene
class youLoseScene: SKScene {
    let menuButton = SKSpriteNode(imageNamed:"BackButton.png")
    let gameOverLabel = SKLabelNode(fontNamed: "Markerfelt-wide")
    
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        menuButton.position = CGPoint(x: 100, y: 70)
        menuButton.name = "menu button"
        self.addChild(menuButton)
        menuButton.setScale(0.05)
        
        gameOverLabel.text = "You Lose"
        gameOverLabel.fontColor =  _ColorLiteralType(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
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
                let menuScene = mainMenuScene(size: self.size)
                self.view!.presentScene(menuScene)
            }
        }
    }
}

// User wins scene
class youWinScene: SKScene {
    let menuButton = SKSpriteNode(imageNamed:"BackButton.png")
    let gameOverLabel1 = SKLabelNode(fontNamed: "Markerfelt-wide")
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        menuButton.position = CGPoint(x: 100, y: 70)
        menuButton.name = "menu button"
        self.addChild(menuButton)
        menuButton.setScale(0.05)
        
        gameOverLabel1.text = "You Win"
        gameOverLabel1.fontColor =  _ColorLiteralType(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
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
                let menuScene = mainMenuScene(size: self.size)
                self.view!.presentScene(menuScene)
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

