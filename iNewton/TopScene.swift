import SpriteKit

class TopScene: SKScene {
    
    var mainCharNode:SKSpriteNode = SKSpriteNode(imageNamed: "newton1.png")
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.mainCharNode.alpha = 1 // 0 ~ 1
        self.mainCharNode.position = CGPoint(x: 250, y: 280)
        self.addChild(self.mainCharNode)
        
        self.backgroundColor = UIColor.white
        
        let movePos = CGPoint(x: self.mainCharNode.position.x, y: self.mainCharNode.position.y + 200)
        let jumpUpAction = SKAction.move(to: movePos, duration: 0.2)
        jumpUpAction.timingMode = .easeInEaseOut
        let jumpDownAction = SKAction.move(to: self.mainCharNode.position, duration: 0.2)
        jumpDownAction.timingMode = .easeInEaseOut
        
        let jumpActions = SKAction.sequence([jumpUpAction, jumpDownAction ])
        
        self.mainCharNode.run(jumpActions)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let box = SKSpriteNode(imageNamed: "apple.png")
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        addChild(box)
        
    }
}
