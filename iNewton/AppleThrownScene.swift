import SpriteKit
import GameplayKit

class AppleThrownScene: SKScene {
    
    let appleNode:SKSpriteNode = SKSpriteNode(imageNamed: "apple.png")
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMove(to view: SKView) {
        // apple
        self.throwApple()
    }
    
    // apple random walk in screen but only once
    func throwApple() {
        
        self.appleNode.size = CGSize(width: 140, height: 140)
        
        let randomBeeYPositionGenerator = GKRandomDistribution(lowestValue: 50, highestValue: Int(self.frame.size.height))
        let yPosition = CGFloat(randomBeeYPositionGenerator.nextInt())
        
        let rightToLeft = arc4random() % 2 == 0
        
        let xPosition = rightToLeft ? self.frame.size.width + self.appleNode.size.width / 2 : -self.appleNode.size.width / 2
        
        self.appleNode.position = CGPoint(x: xPosition, y: yPosition)
        
        if rightToLeft {
            self.appleNode.xScale = -1
        }
        
        self.addChild(self.appleNode)
        
        var distanceToCover = self.frame.size.width + self.appleNode.size.width
        
        if rightToLeft {
            distanceToCover *= -1
        }
        
        let time = TimeInterval(abs(distanceToCover / 140))
        
        let moveAction = SKAction.moveBy(x: distanceToCover, y: 0, duration: time)
        
        let removeAction = SKAction.run {
            self.appleNode.removeAllActions()
            self.appleNode.removeFromParent()
        }
        
        let allActions = SKAction.sequence([moveAction, removeAction])
        
        self.appleNode.run(allActions)
        
    }
}




