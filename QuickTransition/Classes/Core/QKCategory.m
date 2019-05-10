//
//  QKCategory.m
//  QuickTransition
//
//  Created by apple on 2018/8/28.
//

#import "QKCategory.h"
#import "QKAnimator.h"
#import <objc/runtime.h>


@implementation UIViewController (QKCategory)

- (void)setQk_animator:(QKAnimator *)qk_animator {
    objc_setAssociatedObject(self, @selector(qk_animator), qk_animator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.transitioningDelegate = qk_animator;
    self.modalPresentationStyle = UIModalPresentationCustom;
    //[UIViewController currentViewController].navigationController.delegate = qk_animator;
}

- (QKAnimator *)qk_animator {
    return (QKAnimator *)objc_getAssociatedObject(self, _cmd);
}


+ (UIViewController *)currentViewController {
    UIViewController* viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [UIViewController findBestViewController:viewController];
}

+ (UIViewController *)findBestViewController:(UIViewController*)vc {
    
    if (vc.presentedViewController) {
        
        // Return presented view controller
        return [UIViewController findBestViewController:vc.presentedViewController];
        
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        
        // Return right hand side
        UISplitViewController* svc = (UISplitViewController*) vc;
        if (svc.viewControllers.count > 0)
            return [UIViewController findBestViewController:svc.viewControllers.lastObject];
        else
            return vc;
        
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        
        // Return top view
        UINavigationController* svc = (UINavigationController*) vc;
        if (svc.viewControllers.count > 0)
            return [UIViewController findBestViewController:svc.topViewController];
        else
            return vc;
        
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        
        // Return visible view
        UITabBarController* svc = (UITabBarController*) vc;
        if (svc.viewControllers.count > 0)
            return [UIViewController findBestViewController:svc.selectedViewController];
        else
            return vc;
        
    } else {
        return vc;
    }
}


@end
