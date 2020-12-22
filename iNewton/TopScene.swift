import SpriteKit

class TopScene: SKScene {
    
    var mainCharNode:SKSpriteNode = SKSpriteNode(imageNamed: "newton1.png")
    
    var treeFrames:[SKTexture]?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = UIColor.white
        var frames:[SKTexture] = []
        
        let treeAtlas = SKTextureAtlas(named: "Tree")
        
        for index in 1 ... 9 {
            let textureName = "tree_seichou0\(index)"
            let texture = treeAtlas.textureNamed(textureName)
            frames.append(texture)
        }
        
        self.treeFrames = frames
        
    }
    
    override func didMove(to view: SKView) {
        // tree
        self.growTree()
        
        // Newton
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.mainCharNode.alpha = 1
        self.mainCharNode.position = CGPoint(x: 250, y: 250)
        self.addChild(self.mainCharNode)
        
        // jump action
        let movePos = CGPoint(x: self.mainCharNode.position.x, y: self.mainCharNode.position.y + 200)
        let jumpUpAction = SKAction.move(to: movePos, duration: 0.3)
        jumpUpAction.timingMode = .easeInEaseOut
        let jumpDownAction = SKAction.move(to: self.mainCharNode.position, duration: 0.3)
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
    
    func growTree() {
        
        let texture = self.treeFrames![0]
        let tree = SKSpriteNode(texture: texture)
        
        tree.size = CGSize(width: 200, height: 250)
        
        tree.position = CGPoint(x: 120, y: 280)
        
        self.addChild(tree)
        
        tree.run(SKAction.repeat(SKAction.animate(with: self.treeFrames!, timePerFrame: 0.1, resize: false, restore: false), count: 1))
        
    }
}
