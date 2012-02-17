iJodine
=======

iodine front-end for iOS. Small i is for i (duh), and J stands for 2 purposes:

* i for fanboys to recognize
* iJodine is a liet-glish middle for iodine/jodas

Setup
-----

Please, don't read this.

Set up is complicated because of iodine, tunemu and libpcap dependencies. This
is an ad-hoc way that works for now:

compile and include pcap

get bundle from github (https://github.com/Motiejus/ios-static-libraries)
comment out everything but pcap
compile

now we have iPhone paths that we should include to:

* Header Search Paths
* Library Search Paths

one recursive path which includes the compiled directories suits fine.

define DAWIN in build options

At this stage iodine compiles.

II. Add iodine subproject to whatever you are building (here)

1) Drag iodine like a subproject to the workspace.
2) Adjust "Header Search Path" to include paths in the subproject

Profit.
