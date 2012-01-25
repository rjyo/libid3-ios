# Introduction

## What's id3lib

id3lib is a software library for manipulating ID3v1/v1.1 and ID3v2 tags.
id3lib 3.0.x conforms to all ID3v2 standards up to and including the ID3v2.3.0
informal standard.  

The id3lib project makes use of the resources available through
SourceForge.net.  Using SourceForge, the id3lib project is able to provide
several tools for developers, including a project homepage, a mailing list, a
patch manager, bug tracking, and cvs access, among other things.

The id3lib project page, which includes links to all of the above, is:
  http://sourceforge.net/project/?group_id=979

The official id3lib homepage is:
  http://id3lib.sourceforge.net

The id3lib developers' mailing list's address is:
  id3lib-devel@lists.sourceforge.net

You can subscribe, unsubscribe, and view mailing list archives at:
  http://lists.sourceforge.net/mailman/listinfo/id3lib-devel

Information about ID3v2 and related standards can be found at: 
   http://www.id3.org

## What's libid3-ios

libid3-ios is a patched version based on [id3lib 3.8.3-2](http://sourceforge.jp/projects/sfnet_easytag/downloads/id3lib/3.8.3-2/id3lib-3.8.3-2.tar.gz/), which is a unicode patch from 3.8.3. But even with 3.8.3-2, unicode was still not working on iOS. The problem is fixed in [this commit](https://github.com/rjyo/libid3-ios/commit/2b994690cad14cdd9b5b80805e89a203680e7966).

Not all makefile and configure script are copied. Only the source (under ./src) and header (under ./include) files needed are imported into libid3-ios. And as all static library in iOS starts with `lib`. To make this library not something like `libid3lib.a`, `lib` was used as a prefix.

A workable iPhone __Example__ target is also included.

# Installation

## Quick Start (Xcode 4)

1. Add cross-project reference by dragging libid3.xcodeproj to your project
2. Choose __Build Phrases__ tab for your project by chooseing the project file
3. Add __libid3__ aggregate target to __Target Dependencies__ list
5. Add the following to __Link Binary With Libraries__ list
	* libiconv.dylib
	* libstdc++.dylib
	* libz.dylib
	* libid3.a
5. Choose __Build Settings__ tab
6. Add `$(SRCROOT)/libid3-ios/include` to __Library Search Paths__, no recursive. This path should be changed if you put libid3-io somewhere other than project root.

You can always check the settings in __Example__ target if anything not working in your project.

# License

The libid3-ios and id3lib library is open-source software, licensed under the GNU Library General Public License (LGPL). In short, this allows any application to link to and use the library without affecting their license, while guaranteeing that the id3lib library itself (and any modifications to it) will remain freely available in source code form. The project developers therefore greatly encourage input from everyone, be it with feature suggestions, code patches, bug reports, or anything. The best way to contribute to this effort is to subscribe to the mailing list and join in on the discussions! 

Versions of ID3Lib prior to and including version 3.05a were released to the public domain. The last such release is still available for download. These versions are therefore completely free of any license restrictions, but are no longer maintained.