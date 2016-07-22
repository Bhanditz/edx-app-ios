This is the source code for the edX mobile iOS app. It is changing rapidly and
its structure should not be relied upon. See http://code.edx.org for other
parts of the edX code base.

License
=======
This software is licensed under version 2 of the Apache License unless
otherwise noted. Please see ``LICENSE.txt`` for details.

Building
========
0. It is very important that you match the iOS version with the edx-platform version. Current version has release/2.5.0 for edx-app-ios which works with edx-platform release-2016-07-13.2.  We should probably switch to named-release/eucalyptus.rc1 for ios and the named release for Eucalyptus when it is available.

1. Check out the source code: ::
    
    git clone https://github.com/edx/edx-app-ios

2. Open ``edX.xcworkspace``.

3. Ensure that the ``edX`` scheme is selected.

4. Click the **Run** button.

*Note: Our build system requires Java 7 or later.  If you see an error
mentioning "Unsupported major.minor version 51.0 " then you should install a
newer Java SDK.*

Configuration
=============
NB: Follow `these instructions <http://edx.readthedocs.io/projects/edx-installing-configuring-and-running/en/latest/mobile.html>`_ to set up edx-platform for mobile access.

The edX mobile iOS app is designed to connect to an Open edX instance. You must
configure the app with the correct server address and supply appropriate OAuth
credentials. We use a configuration file mechanism similar to that of the Open
edX platform.  This mechanism is also used to make other values available to
the app at runtime and store secret keys for third party services.

There is a default configuration that points to an edX devstack instance
running on localhost. See the ``default_config`` directory. For the default
configuration to work, you must add OAuth credentials specific to your
installation.

Setup
-----
To use a custom configuration in place of the default configuration, you will need to complete these tasks:

1. Create your own configuration directory somewhere else on the file system.
For example, create ``my_config`` as a sibling of the ``edx-app-ios`` repository.

2. Create an ``edx.properties`` file at the top level of the ``edx-app-ios``
repository. In this ``edx.properties`` file, set the ``edx.dir`` property to the
path to your configuration directory. For example, if I stored my configuration
at ``../my_config`` then I'd have the following ``edx.properties``:

::

    edx.dir = '../my_config'

3.  In the configuration directory that you added in step 1, create another
``edx.properties`` file.  This properties file contains a list of filenames.
The files should be in YAML format and are for storing specific keys. These
files are specified relative to the configuration directory. Keys in files
earlier in the list will be overridden by keys from files later in the list.
For example, if I had two files, one shared between iOS and Android called
``shared.yaml`` and one with iOS specific keys called ``ios.yaml``, I would
have the following ``edx.properties``:

::

    edx.ios {
        configFiles = ['shared.yaml', 'ios.yaml']
    }


The full set of known keys can be found in the ``OEXConfig.m``.  These list the high-level keys; sub-keys can be found in the .m files for each config file. These files are found in the Environment group in XCode. (See COURSE_ENROLLMENT and SEGMENT_IO examples below.) 


See also:
`additional documentation <https://openedx.atlassian.net/wiki/display/MA/App+Configuration+Flags>`_.


Additional Customization
------------------------
Right now this code is constructed specifically to build the *edx.org* app.
We're working on making it easier for Open edX installations to apply
customizations and select third party services without modifying the repository
itself. Until that work is complete, you will need to modify or replace files
within your fork of the repo.

To replace the edX branding you will need to replace the ``appicon`` files.
These come in a number of resolutions. See Apple's documentation for more
information on different app icon sizes. Additionally, you will need to replace
the ``splash`` images used in the login screen.

`This spreadsheet <https://docs.google.com/spreadsheets/d/1-q2QLbeXR6kH9qp03t_-4iBuZXtHrtBfs7Qnf-3y1O0/edit#gid=0>`_ has the list of images that need to be replaced.
    
Here is the list of changes to text for rebranding:
 - Replace Bundle Identifier in the project's Target (or found in plist) 
 - Change the CERTIFICATES.SHARE_TEXT to include your company name (this cannot accept the platform_name variable)
 - Optionally change REGISTRATION_AGREEMENT_BUTTON_TITLE to "{platform_name} Terms of Use"
 - in registration.json, change the url in this line: "required": "You must agree to the <a href=..." and two lines below it change the "url", and a few lines below that the "label"
 - Copy the terms and services html page from customer site and paste over Terms-and-Services.htm file
 - Find "/etc/" and replace with website root (eg. "http://www.cloudera.com/")
    
If you need to make more in depth UI changes, most of the user interface is
specified in the ``Main.storyboard`` file, editable from Interface Builder
within Xcode.

Enrolling for courses *should* work out of the box.  See `this website <https://openedx.atlassian.net/wiki/display/MA/App+Configuration+Flags>`_ for info. 

As mentioned, the app relies on the presence of several third party services:
Facebook, NewRelic, Google+, SegmentIO, and Crashlytics. To integrate your own SegmentIO key, enable segment io in edx-platform and set these in your iOS yaml file:
::
    SEGMENT_IO:
        ENABLED: 'YES'
        SEGMENT_IO_WRITE_KEY: '<yourSegmentIOKey>'

You can remove references to each of these services you choose not to use by commenting out the lines that mention these services. We're working to make those dependencies optional.

