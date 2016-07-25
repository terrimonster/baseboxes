== NOTE ON BOX NAMES ==

Dash count indicates level in hierarchy and thus build order -

For instance -

centos-6 <-- base build
centos-6-puppet <-- builds on this
centos-6-puppet-jenkins <-- builds on centos-6-puppet

== Proxies ==
Call packer with -var and then http_proxy and https_proxy (and their capitalized counterparts if you like) to build boxes with proxies.

== Environment variables ==

HTTP_PROXY
HTTPS_PROXY
NO_PROXY
BOX_BUILD - set to the name of a build to build only that box during rake spec
BOX_OVERRIDE - set to true to have rake spec avoid building each box
BOX_FORCE - rebuild packer box even if artifacts are present

== WINDOWS BOXES ==

In order to patch Windows offline the WSUS Offline Updater should be used to create an .ISO file of the available updates. A separate .ISO file should be made for each Operating System version by selecting "Create ISO image per selected product and language" option.

WSUS Offline Updater can be downloaded [here](http://download.wsusoffline.net/). It must be downloaded, extracted and run on a Windows system. If using an internal WSUS server, it must be specified in the tool settings prior to downloading the updates.

For more information on how to use the Offline Updater look [here](http://www.wsusoffline.net/docs/).

Once the updates have been downloaded and the .ISO file created it is mounted as a separate DVD drive in VirtualBox. The updates are then applied from the local collection.
