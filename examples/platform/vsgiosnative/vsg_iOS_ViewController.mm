
#import "vsg_iOS_ViewController.h"

//#include <MoltenVK/mvk_vulkan.h>
//#include "../../Vulkan-Tools/cube/cube.c"

#include <vsg/all.h>

#pragma mark -
#pragma mark vsg_iOS_ViewController

@implementation vsg_iOS_ViewController {
    CADisplayLink* _displayLink;
    //struct demo demo;
}

-(void) dealloc {
    //demo_cleanup(&demo);
    //[_displayLink release];
    //[super dealloc];
}

/** Since this is a single-view app, init Vulkan when the view is loaded. */
-(void) viewDidLoad {
    [super viewDidLoad];

    self.view.contentScaleFactor = UIScreen.mainScreen.nativeScale;
    self.view.backgroundColor = UIColor.blueColor;
#if TARGET_OS_SIMULATOR
    // Avoid linear host-coherent texture loading on simulator
    const char* argv[] = { "cube", "--use_staging" };
#else
    const char* argv[] = { "cube" };
#endif
    int argc = sizeof(argv)/sizeof(char*);
    //demo_main(&demo, self.view.layer, argc, argv);
    //demo_draw(&demo);

    uint32_t fps = 60;	
    _displayLink = [CADisplayLink displayLinkWithTarget: self selector: @selector(renderLoop)];
    [_displayLink setFrameInterval: 60 / fps];
    [_displayLink addToRunLoop: NSRunLoop.currentRunLoop forMode: NSDefaultRunLoopMode];
}

-(void) renderLoop {
    //demo_draw(&demo);
}

// Allow device rotation to resize the swapchain
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    //demo_resize(&demo);
}

@end


#pragma mark -
#pragma mark vsg_iOS_View

@implementation vsg_iOS_View

/** Returns a Metal-compatible layer. */
+(Class) layerClass { return [CAMetalLayer class]; }

@end
