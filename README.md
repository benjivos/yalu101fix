# yalu101fix

This tweak fixes the loading of substrate when completing the jailbreak with same command as r3st1t0u (see https://github.com/r3st1t0u/Order66.git, thanks!). 

1. Install theos-jailed (https://github.com/kabiroberai/theos-jailed/wiki/Installation)
2. Put mach_portal+yalu-b3.ipa in top directory
3. Generate provisioning profile with app group (any name) and matching BUNDLE_ID in Makefile
4. To install, from yalu101 directory type:
  * make package install PROFILE=XXX.mobileprovision

Many thanks to qwertyoruiopz and marcograssi by supplying the jailbreak!

