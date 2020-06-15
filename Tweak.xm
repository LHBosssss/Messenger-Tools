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

%group disableReadReceipt
	%hook LSMessageListViewController
		- (void)_sendReadReceiptIfNeeded {
			if (!disableReadReceipt) {
				%orig;
				return;
			}
		}
	%end
%end

%group disableTypingIndicator
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
	%hook LSComposerViewController
		- (void)_updateComposerEventWithTextViewChanged:(UITextView *)arg1 {
			if (!disableTypingIndicator) {
				%orig;
				return;
			}
			LSComposerView *replyView = MSHookIvar<LSComposerView *>(self, "_composerView");
			LSComposerComponentStackView *messageView = MSHookIvar<LSComposerComponentStackView *>(replyView, "_topStackView");
			if (messageView.frame.size.height > 0.0 || [arg1.text containsString:@"@"]) {
        		%orig;
      		}
		}
	%end
%end

%group disableStorySeenReceipt
	@interface LSStoryBucketViewControllerBase : UIViewController {}
		- (void)startTimer;
	@end
	@interface LSStoryBucketViewController : LSStoryBucketViewControllerBase {}
	@end
	%hook LSStoryBucketViewController
		- (void)startTimer {
			if (!disableStorySeenReceipt) {
				%orig;
				return;
			}
		}
	%end
%end

%ctor {
	reloadPrefs();
	dlopen([[[NSBundle mainBundle].bundlePath stringByAppendingPathComponent:@"Frameworks/NotInCore.framework/NotInCore"] UTF8String], RTLD_NOW);
	%init(disableReadReceipt);
	%init(disableTypingIndicator);
	%init(disableStorySeenReceipt);
}