stretchableImageViewWithCapInsets
=================================

resizableImageWithCapInsets:resizingMode: for ios 5

Example
=================================
```objective-c
UIImage *image = [UIImage imageNamed:@"frame_light_wood"];
UIImageView *imageView;
if ([UIImage instancesRespondToSelector:@selector(resizableImageWithCapInsets:resizingMode:)]) {
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(64, 64, 64, 64) resizingMode:UIImageResizingModeStretch];
    imageView = [[UIImageView alloc] initWithImage:image];
} else {
   imageView = [image stretchableImageViewWithCapInsets:UIEdgeInsetsMake(64, 64, 64, 64)];
}
```
</code>
