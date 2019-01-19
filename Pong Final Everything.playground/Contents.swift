// made by: Benjamin Hilderman
// made on: Jan 2018
// made for: ICS3U
// pong CPT

import PlaygroundSupport
import SpriteKit
import AVFoundation

var SPEED : Double = 0.4
var gameLevel : Int = 1

class gameScene: SKScene, SKPhysicsContactDelegate {
    // Variables
    let moveToNextScene = SKAction.wait(forDuration: 1)
    
    
    
    override func didMove(to view: SKView) {
        // Background
        let gameSceneBackground = SKSpriteNode(imageNamed: "IMG_1028.PNG")
        self.backgroundColor = SKColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        gameSceneBackground.name = "Splash scene background"
        gameSceneBackground.position = CGPoint(x: frame.size.width/2.2, y: frame.size.height / 2.8)
        
        self.addChild(gameSceneBackground) 
        gameSceneBackground.setScale(0.5)
        gameSceneBackground.run(moveToNextScene) {
            let menuScene = loadingScene(size: self.size)
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

class loadingScene: SKScene, SKPhysicsContactDelegate {
    // Variables
    let moveToNextScene = SKAction.wait(forDuration: 1)
    
    override func didMove(to view: SKView) {
        // Background
        let loadingSceneBackground = SKSpriteNode(imageNamed: "IMG_2639.JPG")
        self.backgroundColor = SKColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        loadingSceneBackground.name = "Splash scene background"
        loadingSceneBackground.position = CGPoint(x: 480, y: 270)
        self.addChild(loadingSceneBackground) 
        loadingSceneBackground.setScale(0.65)
        loadingSceneBackground.run(moveToNextScene) {
            let mScene = mainMenuScene(size: self.size)
            self.view!.presentScene(mScene)
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
    let normalMode = SKSpriteNode(imageNamed: "IMG_2656.PNG")
    let bounceMode = SKSpriteNode(imageNamed: "IMG_2640.PNG")
    let settingsButton = SKSpriteNode(imageNamed: "IMG_2608.PNG")
    
    override func didMove(to view: SKView) {
        // this will run when the scene loads
        
        // plays music
        
        SPEED = 0.4
        gameLevel = 1
        
        // The Background
        let mainMenuBackground = SKSpriteNode(imageNamed: "IMG_2638.JPG")
        self.backgroundColor = SKColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        mainMenuBackground.name = "Main Menu Background"
        mainMenuBackground.position = CGPoint(x: frame.size.width/2, y: frame.size.height / 2.2)
        self.addChild(mainMenuBackground) 
        mainMenuBackground.setScale(0.65)
        
        normalMode.name = "Normal Mode"
        normalMode.position = CGPoint(x: 640, y: 265)
        self.addChild(normalMode)
        normalMode.setScale(0.17)
        
        bounceMode.name = "Bounce Mode"
        bounceMode.position = CGPoint(x: 300, y: 300)
        self.addChild(bounceMode)
        bounceMode.setScale(0.17)
        
        settingsButton.name = "Settings Button"
        settingsButton.position = CGPoint(x: frame.size.width / 5  , y: frame.size.height/5)
        self.addChild(settingsButton )
        settingsButton.setScale(0.05)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "Normal Mode" {
                let mainGameScene = normalGameScene(size: self.size)
                self.view!.presentScene(mainGameScene)
                self.scene?.removeAllActions()
                
            } 
            if let touchedNodeName = touchedNode.name {
                if touchedNodeName == "Bounce Mode" {
                    let mainGameScene = bounceGameScene(size: self.size)
                    self.view!.presentScene(mainGameScene)
                    self.scene?.removeAllActions()

                    
                } 
            
            if touchedNodeName == "Settings Button" {
                let mainGameScene = instructionsScene(size: self.size)
                self.view!.presentScene(mainGameScene)
                self.scene?.removeAllActions()
            }
        }
    }
    func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
        
} 
    
}
class instructionsScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let backButton = SKSpriteNode(imageNamed: "BackButton.png")
    let firstLineLabel : UILabel = UILabel()
    let secondLineLabel : UILabel = UILabel()
    let clickForMusic : UILabel = UILabel()
    let titleLabel : UILabel = UILabel()
    let audioButton = SKSpriteNode(imageNamed: "IMG_2657.PNG")
    
    override func didMove(to view: SKView) {
        // this will run when the scene loads
        
        self.backgroundColor = SKColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        backButton.position = CGPoint(x: 100, y: 70)
        backButton.name = "backbutton"
        self.addChild(backButton)
        backButton.setScale(0.05)
        
        audioButton.position = CGPoint(x: 100, y: 300)
        audioButton.name = "Audio"
        self.addChild(audioButton)
        audioButton.setScale(0.2)
        
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
        
        clickForMusic.text = "Turn on music"
        clickForMusic.textColor =  _ColorLiteralType(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(clickForMusic)
        clickForMusic.translatesAutoresizingMaskIntoConstraints = false
        clickForMusic.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        clickForMusic.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
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
                clickForMusic.text = ""
                let instructionsScene = mainMenuScene(size: self.size)
                self.view!.presentScene(instructionsScene)
            }
        
            if nodeTouchedName == "Audio" {
                // plays music
                self.scene?.run(SKAction.repeatForever(SKAction.playSoundFileNamed ("Music.mp3", waitForCompletion: true)))
            }
        
        }
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    
}
class normalGameScene: SKScene , SKPhysicsContactDelegate {
    
    // Variables
    let botLabel = SKLabelNode(fontNamed: "Markerfelt-wide")
    let userLabel = SKLabelNode(fontNamed: "Markerfelt-wide")
    let levelLabel = SKLabelNode(fontNamed: "Markerfelt-wide")
    let moveToNextScene = SKAction.wait(forDuration: 2)
    var ball = SKShapeNode()
    var playerPaddle = SKSpriteNode()
    var botPaddle = SKSpriteNode()
    
    var botScore : Int = 0
    var userScore : Int = 0
    var gameOver : Bool = false
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self 
         
        SPEED = SPEED - 0.08
        
        var playerPaddleActive: Bool = true
        var botPaddleActive: Bool = true
        
        self.view?.isMultipleTouchEnabled = true
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        self.backgroundColor = SKColor(red: 0, green: 0, blue: 0, alpha: 0)
        let centerLine = SKSpriteNode(imageNamed: "CenterLine.png")
        
        self.addChild(centerLine) 
        centerLine.position = CGPoint(x: frame.size.width/2, y: frame.size.height / 2.35)
        centerLine.setScale(0.6)
        
        ball = SKShapeNode(circleOfRadius: 14)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 14)
        ball.fillColor = SKColor.white
        ball.position = CGPoint(x: self.size.width/1.5, y: self.size.height/1.5)
        ball.physicsBody!.allowsRotation = false
        ball.physicsBody!.friction = 0
        ball.physicsBody!.linearDamping = 0
        ball.physicsBody!.restitution = 1
        ball.physicsBody?.affectedByGravity = false
        self.addChild(ball)
        
        playerPaddle = SKSpriteNode(color: SKColor.white, size: CGSize(width: 15, height: 70))
        playerPaddle.physicsBody = SKPhysicsBody(rectangleOf: playerPaddle.size)
        playerPaddle.physicsBody!.isDynamic = false
        playerPaddle.physicsBody!.friction = 0
        playerPaddle.physicsBody!.restitution = 1
        playerPaddle.physicsBody!.linearDamping = 0
        playerPaddle.position = CGPoint(x: 100, y: (frame.size.height / 2))
        self.addChild(playerPaddle)
        
        botPaddle = SKSpriteNode(color: SKColor.white, size: CGSize(width: 15, height: 70))
        botPaddle.physicsBody = SKPhysicsBody(rectangleOf: botPaddle.size)
        botPaddle.physicsBody!.isDynamic = false
        botPaddle.physicsBody!.friction = 0
        botPaddle.physicsBody!.restitution = 1
        botPaddle.physicsBody!.linearDamping = 0
        botPaddle.position = CGPoint(x: frame.size.width - 100, y: (frame.size.height / 2))
        self.addChild(botPaddle)
        
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
        
        levelLabel.text = " Level " + String(gameLevel)
        levelLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        levelLabel.fontColor =  _ColorLiteralType(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        levelLabel.fontSize = 20
        levelLabel.position = CGPoint(x: frame.size.width - 100, y: frame.size.height - 40)
        self.addChild(levelLabel)
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
        // Ball Moves
        ball.physicsBody?.velocity = CGVector(dx: 6, dy: 6)
        ball.physicsBody?.applyImpulse(CGVector(dx: -10, dy: -5))
        
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        // Ball X Position
        botPaddle.run(SKAction.moveTo(y: ball.position.y, duration: TimeInterval(SPEED)))
        
        
        // When ball goes behind Users paddle
        if ball.position.x > botPaddle.position.x + 70 {
            playerPaddle.position = CGPoint(x: 100 , y: (frame.size.height / 2))
            ball.position = CGPoint(x: frame.size.width / 2 , y: (frame.size.height / 2))
            ball.physicsBody?.velocity = CGVector(dx: 6, dy: 6)
            ball.physicsBody?.applyImpulse(CGVector(dx: -10 - (gameLevel / 20), dy: -5))
            userScore += 1 
            userLabel.text = "" + String(userScore)
        }
        
        // When ball goes behind Bots paddle
        if ball.position.x < playerPaddle.position.x - 70 {
            playerPaddle.position = CGPoint(x: 100 , y: (frame.size.height / 2))
            ball.position = CGPoint(x: frame.size.width / 2 , y: (frame.size.height / 2))
            ball.physicsBody?.velocity = CGVector(dx: 6, dy: 6)
            ball.physicsBody?.applyImpulse(CGVector(dx: -10 - (gameLevel / 20), dy: -5))
            botScore += 1 
            botLabel.text = "" + String(botScore)
        }
        //If bot wins
        if botScore >= 6 && gameOver == false {
            gameLevel = 1
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            ball.run(moveToNextScene) {
                let doneScene = youLoseScene(size: self.size)
                self.view!.presentScene(doneScene)
            }
            gameOver = true
        }
        //If user wins
        if userScore >= 6 && gameOver == false { 
            gameLevel += 1
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            ball.run(moveToNextScene) {
                let doneScene = youWinScene(size: self.size)
                self.view!.presentScene(doneScene)
            }
            gameOver = true
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


class bounceGameScene: SKScene , SKPhysicsContactDelegate {
    
    // Variables
    let botLabel = SKLabelNode(fontNamed: "Markerfelt-wide")
    let userLabel = SKLabelNode(fontNamed: "Markerfelt-wide")
    let levelLabel = SKLabelNode(fontNamed: "Markerfelt-wide")
    let moveToNextScene = SKAction.wait(forDuration: 2)
    var ball = SKShapeNode()
    var playerPaddle = SKSpriteNode()
    var botPaddle = SKSpriteNode()
    
    var botScore : Int = 0
    var userScore : Int = 0
    var gameOver : Bool = false
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self 
        
        SPEED = SPEED - 0.1
        
        var playerPaddleActive: Bool = true
        var botPaddleActive: Bool = true
        
        self.view?.isMultipleTouchEnabled = true
        
        self.backgroundColor = SKColor(red: 0, green: 0, blue: 0, alpha: 0)
        let centerLine = SKSpriteNode(imageNamed: "CenterLine.png")
        
        self.addChild(centerLine) 
        centerLine.position = CGPoint(x: frame.size.width/2, y: frame.size.height / 2.35)
        centerLine.setScale(0.6)
        
        ball = SKShapeNode(circleOfRadius: 14)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 14)
        ball.fillColor = SKColor.white
        ball.position = CGPoint(x: self.size.width/1.5, y: self.size.height/1.5)
        ball.physicsBody!.allowsRotation = false
        ball.physicsBody!.friction = 0
        ball.physicsBody!.linearDamping = 0
        ball.physicsBody!.restitution = 1
        ball.physicsBody!.affectedByGravity = true
        self.addChild(ball)
        
        playerPaddle = SKSpriteNode(color: SKColor.white, size: CGSize(width: 15, height: 70))
        playerPaddle.physicsBody = SKPhysicsBody(rectangleOf: playerPaddle.size)
        playerPaddle.physicsBody!.isDynamic = false
        playerPaddle.physicsBody!.friction = 0
        playerPaddle.physicsBody!.restitution = 1
        playerPaddle.physicsBody!.linearDamping = 0
        playerPaddle.position = CGPoint(x: 100, y: (frame.size.height / 2))
        self.addChild(playerPaddle)
        
        botPaddle = SKSpriteNode(color: SKColor.white, size: CGSize(width: 15, height: 70))
        botPaddle.physicsBody = SKPhysicsBody(rectangleOf: botPaddle.size)
        botPaddle.physicsBody!.isDynamic = false
        botPaddle.physicsBody!.friction = 0
        botPaddle.physicsBody!.restitution = 1
        botPaddle.physicsBody!.linearDamping = 0
        botPaddle.position = CGPoint(x: frame.size.width - 100, y: (frame.size.height / 2))
        self.addChild(botPaddle)
        
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
        
        levelLabel.text = " Level " + String(gameLevel)
        levelLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        levelLabel.fontColor =  _ColorLiteralType(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        levelLabel.fontSize = 20
        levelLabel.position = CGPoint(x: frame.size.width - 100, y: frame.size.height - 40)
        self.addChild(levelLabel)
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
        // Ball Moves
        
        ball.physicsBody?.applyImpulse(CGVector(dx: -5, dy: -5))
    }
    
    override func  update(_ currentTime: TimeInterval) {
        // Ball X Position
        botPaddle.run(SKAction.moveTo(y: ball.position.y, duration: TimeInterval(SPEED)))
        
        // When ball goes behind Users paddle
        if ball.position.x > botPaddle.position.x + 70 {
            playerPaddle.position = CGPoint(x: 100 , y: (frame.size.height / 2))
            ball.position = CGPoint(x: frame.size.width / 2 , y: (frame.size.height / 2))
            ball.physicsBody?.velocity = CGVector(dx: -8, dy: -8)
            ball.physicsBody?.applyImpulse(CGVector(dx: -10 - (gameLevel / 20), dy: -5))
            userScore += 1 
            userLabel.text = "" + String(userScore)
        }
        
        // When ball goes behind Bots paddle
        if ball.position.x < playerPaddle.position.x - 70 {
            playerPaddle.position = CGPoint(x: 100 , y: (frame.size.height / 2))
            ball.position = CGPoint(x: frame.size.width / 2 , y: (frame.size.height / 2))
            ball.physicsBody?.velocity = CGVector(dx: 6, dy: 6)
            ball.physicsBody?.applyImpulse(CGVector(dx: -10 - (gameLevel / 20), dy: -5))
            botScore += 1 
            botLabel.text = "" + String(botScore)
        }
        //If bot wins
        if botScore >= 6 && gameOver == false {
            gameLevel = 1
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            ball.run(moveToNextScene) {
                let doneScene = youLoseScene(size: self.size)
                self.view!.presentScene(doneScene)
            }
            gameOver = true
        }
        //If user wins
        if userScore >= 6 && gameOver == false { 
            gameLevel += 1
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            ball.run(moveToNextScene) {
                let doneScene = youWinBounceScene(size: self.size)
                self.view!.presentScene(doneScene)
            }
            gameOver = true
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

// Normal game mode user wins scene
class youWinScene: SKScene {
    let menuButton = SKSpriteNode(imageNamed:"BackButton.png")
    let gameOverLabel1 = SKLabelNode(fontNamed: "Markerfelt-wide")
    let continueButton = SKSpriteNode(imageNamed:"IMG_2641.PNG")
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        menuButton.position = CGPoint(x: 100, y: 70)
        menuButton.name = "menu button"
        self.addChild(menuButton)
        menuButton.setScale(0.05)
        
        continueButton.position = CGPoint(x: 410, y: 350)
        continueButton.name = "continue button"
        self.addChild(continueButton)
        continueButton.setScale(0.3)
        
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
                
                if touchedNodeName == "continue button" {
                    let pongScene = normalGameScene(size: self.size)
                    self.view!.presentScene(pongScene)
            }
        }
    }
}
// Bounce mode user wins scene
class youWinBounceScene: SKScene {
    let menuButton = SKSpriteNode(imageNamed:"BackButton.png")
    let gameOverLabel1 = SKLabelNode(fontNamed: "Markerfelt-wide")
    let continueButton = SKSpriteNode(imageNamed:"IMG_2641.PNG")
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        menuButton.position = CGPoint(x: 100, y: 70)
        menuButton.name = "menu button"
        self.addChild(menuButton)
        menuButton.setScale(0.05)
        
        continueButton.position = CGPoint(x: 410, y: 350)
        continueButton.name = "continue button"
        self.addChild(continueButton)
        continueButton.setScale(0.3)
        
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
            
            if touchedNodeName == "continue button" {
                let pongScene = bounceGameScene(size: self.size)
                self.view!.presentScene(pongScene)
            }
        }
    }
}


// set the frame to be the size for your iPad
let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)

let scene = gameScene(size: frame.size)
scene.scaleMode = SKSceneScaleMode.resizeFill
let skView = SKView(frame: frame)
skView.presentScene(scene)

PlaygroundPage.current.liveView = skView

