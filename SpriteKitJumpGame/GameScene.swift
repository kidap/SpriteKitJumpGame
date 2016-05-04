//
//  GameScene.swift
//  SpriteKitJumpGame
//
//  Created by Karlo Pagtakhan on 05/03/2016.
//  Copyright (c) 2016 AccessIT. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
  let character = MainCharacter()
  
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
      
      
      physicsWorld.gravity = CGVectorMake(0, -9.8)
      physicsBody  = SKPhysicsBody(edgeLoopFromRect: CGRect(origin: CGPointZero, size: size))
      
      
      character.xScale = 0.1
      character.yScale = 0.1
      character.position = CGPoint(x: size.width/2, y: character.size.height / 2)
      character.physicsBody = SKPhysicsBody(rectangleOfSize: character.size)
      character.physicsBody?.affectedByGravity = true
      character.physicsBody?.categoryBitMask
      character.physicsBody?.mass = 1.0
      character.physicsBody?.allowsRotation = false
      character.onGround = true
      character.physicsBody?.velocity = CGVector(dx: 5, dy: 5)
      
      addChild(character)
      
      let platform = SKSpriteNode(imageNamed: "platform")
      platform.position = CGPoint(x: size.width / 2, y: size.height / 2 - 300)
      platform.physicsBody = SKPhysicsBody(rectangleOfSize: platform.size)
      platform.physicsBody?.affectedByGravity = false
      platform.physicsBody?.dynamic = false
      addChild(platform)
      
      let platform2 = SKSpriteNode(imageNamed: "platform")
      platform2.position = CGPoint(x: size.width / 2 + 200, y: size.height / 2 - 200)
      platform2.physicsBody = SKPhysicsBody(rectangleOfSize: platform.size)
      platform2.physicsBody?.affectedByGravity = false
      platform2.physicsBody?.dynamic = false
      addChild(platform2)
    }
  
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
          let location = touch.locationInNode(self)
          
          
          //if character.position.y <= 33{
          let offsetX = location.x - character.position.x
          let jumpUp = SKAction.moveBy(CGVectorMake(offsetX, 200) , duration: 0.3)
          
          
          character.runAction(SKAction.sequence([jumpUp])){
            self.character.onGround = true
          }
          
          self.character.physicsBody?.applyForce(CGVectorMake(offsetX, 200), atPoint: CGPoint(x: 0, y: 0))
          //}

        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}

class MainCharacter:SKSpriteNode{
  var onGround:Bool = false
  
  init(){
    let texture = SKTexture(imageNamed: "main")
    super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}