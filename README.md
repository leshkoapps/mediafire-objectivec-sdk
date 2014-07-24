![MediaFire](http://www.mediafire.com/images/brand-assets/mf-logo.png) 
# MediaFire's Objective-C SDK 

Leverage the MediaFire Platform to connect with millions of MediaFire users around the world and add powerful features to your Objective-C app.

Full documentation available here: [MediaFire Developers](http://www.mediafire.com/developers/sdks_and_tools/) (Coming Soon)

See the steps below on how to quickly add MediaFire SDK to your project. There is also a simple demo app for example usage.

## Adding to your project

1. Get the latest source from GitHub by either [downloading as a zip file](https://github.com/MediaFire/mediafire-objectivec-sdk/archive/master.zip) or by cloning the repository at `https://github.com/MediaFire/mediafire-objectivec-sdk.git`.
2. Create a new Xcode project or open an existing project.
3. Drag the MediaFireSDK Xcode Project file `MediaFireSDK.xcodeproj` into your Xcode Project Navigator. Or add it using File > Add Files to 'Your Project'.
4. Add `MediaFireSDK` under "Target Dependencies" in your Target's "Build Phases".
5. Add `libMediaFireSDK.a` under "Link Binary With Libraries" in your Target's "Build Phases".
6. Add "Other Link Flag" `-all_load` under "Linking" in your Target's "Build Settings".
7. Import `MediaFireSDK.h` in `AppDelegate.m`

  ```obj-c
  #import "MediaFireSDK/MediaFireSDK.h"
  ```

8. Add the following configuration code to your `AppDelegate.m` within `didFinishLaunchingWithOptions` 

  ```obj-c
  [MediaFireSDK createWithConfig:@{@"app_id" : @"<your app id>", @"api_key" : @"<your api key>"}];
  ```

9. Add the following log capture function to `AppDelegate.m`:

  ```obj-c
  extern void MFCaptureLogMessage(NSString* message) {
      // Use this method to capture log messages from MediaFire SDK.
  }
  ```

Build and run project. If errors occur, clean build folder (⌥⇧⌘K) and try again. 

## Usage

Works on iOS 7.0+
