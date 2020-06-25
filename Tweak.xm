#import <RemoteLog.h>

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.icraze.noticlearerprefs.plist"

@interface PLPlatterHeaderContentView : UIView
@end

@interface UIView (NotiClearer)
-(void)_executeClearAction;
@end

static BOOL kEnabled;
float kDismissWaitTime;

static void loadPrefs() {
  NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
  kEnabled = [[prefs objectForKey:@"kEnabled"] boolValue];
}

%hook PLPlatterHeaderContentView
-(void)_updateTextAttributesForDateLabel{
  %orig;
  if (kEnabled) {
    if ([self.superview.superview.superview.superview.superview.superview class] == objc_getClass("NCNotificationListCell")) {
      float kDismissWaitTime = [[[NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.icraze.noticlearerprefs.plist"] objectForKey:@"kDismissWaitTime"] floatValue];
      [NSTimer scheduledTimerWithTimeInterval:kDismissWaitTime target:self selector:@selector(NotificationClearerClearNotification:) userInfo:nil repeats:NO];
    }
  }
}
%new
- (void) NotificationClearerClearNotification:(NSTimer*)t {
  [self.superview.superview.superview.superview.superview.superview _executeClearAction];
}
%end

%ctor{
    loadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.icraze.noticlearerprefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}
