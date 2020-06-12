#include "MessengerToolsRootListController.h"
#include <RemoteLog.h>
@implementation MessengerToolsRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}
- (void) applyChanges {
}

@end

