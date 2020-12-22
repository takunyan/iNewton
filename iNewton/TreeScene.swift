import UIKit
import SpriteKit

class TreeScene: SKScene {
    
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
        self.growTree()
    }
    
    func growTree() {
        
        let texture = self.treeFrames![0]
        let tree = SKSpriteNode(texture: texture)
        
        tree.size = CGSize(width: 140, height: 140)
        
        tree.position = CGPoint(x: 120, y: 240)
        
        self.addChild(tree)
        
        tree.run(SKAction.repeat(SKAction.animate(with: self.treeFrames!, timePerFrame: 0.3, resize: false, restore: false), count: 1))
                
    }
}
