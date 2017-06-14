# BlurImage
类似Itunes Music (iOS) 和网易云音乐上的背景图片虚化效果



### 使用

```swift
let scaleImg = bgImage.scale(toHeight: self.view.frame.height)
scaleImg.blurImage(with: .black, colorOpacity: 0, saturationDeltaFactor: 2.8, blurRadius: 30, completion: { (blurImage) in
	if let image = blurImage {
		self.view.backgroundColor = UIColor.init(patternImage: image)
	}
})
```



### 效果

![sample0](https://github.com/midmirror/BlurImage/blob/master/sample0.png "sample0")
