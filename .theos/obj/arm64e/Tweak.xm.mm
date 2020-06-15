#line 1 "Tweak.xm"
#import <Cephei/HBPreferences.h>

BOOL disableReadReceipt;
BOOL disableTypingIndicator;
BOOL disableStorySeenReceipt;

static void reloadPrefs() {
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.ldh.messengertoolsbundle"];
	[prefs registerBool:&disableReadReceipt default: YES forKey:@"DisableReadReceipt"];
	[prefs registerBool:&disableTypingIndicator default: YES forKey:@"DisableTypingIndicator"];
	[prefs registerBool:&disableStorySeenReceipt default: YES forKey:@"DisableStorySeenReceipt"];

}


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class LSStoryBucketViewController; @class LSComposerViewController; @class LSMessageListViewController; 


#line 15 "Tweak.xm"
static void (*_logos_orig$disableReadReceipt$LSMessageListViewController$_sendReadReceiptIfNeeded)(_LOGOS_SELF_TYPE_NORMAL LSMessageListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$disableReadReceipt$LSMessageListViewController$_sendReadReceiptIfNeeded(_LOGOS_SELF_TYPE_NORMAL LSMessageListViewController* _LOGOS_SELF_CONST, SEL); 
	
		static void _logos_method$disableReadReceipt$LSMessageListViewController$_sendReadReceiptIfNeeded(_LOGOS_SELF_TYPE_NORMAL LSMessageListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
			if (!disableReadReceipt) {
				_logos_orig$disableReadReceipt$LSMessageListViewController$_sendReadReceiptIfNeeded(self, _cmd);
				return;
			}
		}
	


static void (*_logos_orig$disableTypingIndicator$LSComposerViewController$_updateComposerEventWithTextViewChanged$)(_LOGOS_SELF_TYPE_NORMAL LSComposerViewController* _LOGOS_SELF_CONST, SEL, UITextView *); static void _logos_method$disableTypingIndicator$LSComposerViewController$_updateComposerEventWithTextViewChanged$(_LOGOS_SELF_TYPE_NORMAL LSComposerViewController* _LOGOS_SELF_CONST, SEL, UITextView *); 
	@interface LSComposerComponentStackView: UIStackView {}
	@end
	@interface LSTextView : UITextView {}
	@end
	@interface LSComposerView {
		LSComposerComponentStackView *_topStackView;
	}
	@end
	@interface LSComposerViewController {
		LSComposerView *_composerView;
	}
	@end
	
		static void _logos_method$disableTypingIndicator$LSComposerViewController$_updateComposerEventWithTextViewChanged$(_LOGOS_SELF_TYPE_NORMAL LSComposerViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITextView * arg1) {
			if (!disableTypingIndicator) {
				_logos_orig$disableTypingIndicator$LSComposerViewController$_updateComposerEventWithTextViewChanged$(self, _cmd, arg1);
				return;
			}
			LSComposerView *replyView = MSHookIvar<LSComposerView *>(self, "_composerView");
			LSComposerComponentStackView *messageView = MSHookIvar<LSComposerComponentStackView *>(replyView, "_topStackView");
			if (messageView.frame.size.height > 0.0 || [arg1.text containsString:@"@"]) {
        		_logos_orig$disableTypingIndicator$LSComposerViewController$_updateComposerEventWithTextViewChanged$(self, _cmd, arg1);
      		}
		}
	


static void (*_logos_orig$disableStorySeenReceipt$LSStoryBucketViewController$startTimer)(_LOGOS_SELF_TYPE_NORMAL LSStoryBucketViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$disableStorySeenReceipt$LSStoryBucketViewController$startTimer(_LOGOS_SELF_TYPE_NORMAL LSStoryBucketViewController* _LOGOS_SELF_CONST, SEL); 
	@interface LSStoryBucketViewControllerBase : UIViewController {}
		- (void)startTimer;
	@end
	@interface LSStoryBucketViewController : LSStoryBucketViewControllerBase {}
	@end
	
		static void _logos_method$disableStorySeenReceipt$LSStoryBucketViewController$startTimer(_LOGOS_SELF_TYPE_NORMAL LSStoryBucketViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
			if (!disableStorySeenReceipt) {
				_logos_orig$disableStorySeenReceipt$LSStoryBucketViewController$startTimer(self, _cmd);
				return;
			}
		}
	


static __attribute__((constructor)) void _logosLocalCtor_84dcc16b(int __unused argc, char __unused **argv, char __unused **envp) {
	reloadPrefs();
	dlopen([[[NSBundle mainBundle].bundlePath stringByAppendingPathComponent:@"Frameworks/NotInCore.framework/NotInCore"] UTF8String], RTLD_NOW);
	{Class _logos_class$disableReadReceipt$LSMessageListViewController = objc_getClass("LSMessageListViewController"); MSHookMessageEx(_logos_class$disableReadReceipt$LSMessageListViewController, @selector(_sendReadReceiptIfNeeded), (IMP)&_logos_method$disableReadReceipt$LSMessageListViewController$_sendReadReceiptIfNeeded, (IMP*)&_logos_orig$disableReadReceipt$LSMessageListViewController$_sendReadReceiptIfNeeded);}
	{Class _logos_class$disableTypingIndicator$LSComposerViewController = objc_getClass("LSComposerViewController"); MSHookMessageEx(_logos_class$disableTypingIndicator$LSComposerViewController, @selector(_updateComposerEventWithTextViewChanged:), (IMP)&_logos_method$disableTypingIndicator$LSComposerViewController$_updateComposerEventWithTextViewChanged$, (IMP*)&_logos_orig$disableTypingIndicator$LSComposerViewController$_updateComposerEventWithTextViewChanged$);}
	{Class _logos_class$disableStorySeenReceipt$LSStoryBucketViewController = objc_getClass("LSStoryBucketViewController"); MSHookMessageEx(_logos_class$disableStorySeenReceipt$LSStoryBucketViewController, @selector(startTimer), (IMP)&_logos_method$disableStorySeenReceipt$LSStoryBucketViewController$startTimer, (IMP*)&_logos_orig$disableStorySeenReceipt$LSStoryBucketViewController$startTimer);}
}
