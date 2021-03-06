#  -*- coding: utf-8 -*-
#
#  ZanyBlue, an Ada library and framework for finite element analysis.
#
#  Copyright (c) 2012, 2016, Michael Rohan <mrohan@zanyblue.com>
#  All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions
#  are met:
#
#    * Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#
#    * Redistributions in binary form must reproduce the above copyright
#      notice, this list of conditions and the following disclaimer in the
#      documentation and/or other materials provided with the distribution.
#
#    * Neither the name of ZanyBlue nor the names of its contributors may
#      be used to endorse or promote products derived from this software
#      without specific prior written permission.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
#  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
#  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
#  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
#  HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
#  TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
#  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
#  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
#  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

#
# Makefile for the example app to print Jenkins message to the standard output
# stream.  NOTE: This generally only works for English, the Windows command
# window does not support UTF-8 ouptut.
#

# If run from within the source tree, add the bin directory to the path
PATH:=../../../bin:$(PATH)
export PATH

RM=rm -f
ifeq ($(OS),Windows_NT)
RM=del
endif

zbx_jenkins:	$(wildcard *.ad?) jenkins-messages.ads jenkins-messages.adb
	gprbuild -q -p -aP../../../src -P zbx_jenkins.gpr

jenkins-messages.ads jenkins-messages.adb: $(wildcard mesg/*.properties)
	zbmcompile -O -v Jenkins.Messages -d mesg App Jenkins

run:	zbx_jenkins
	zbx_jenkins

run_%:	zbx_jenkins
	zbx_jenkins -l$*

clean:
	gprclean -aP../../../src -P zbx_jenkins.gpr
	-$(RM) $(wildcard jenkins-messages.*)

# Following definitions are used to sync the properties from a Git clone of the
# Jenkins repository.  Not really part of the example, just needed a good place
# to keep this.
J_TLD=jenkins
J_VERSION=jenkins-2.9
J_URL=https://github.com/jenkinsci/jenkins.git
J_APPDIR=core/src/main/resources/hudson
J_PROPERTIES=$(patsubst $(J_TLD)/$(J_APPDIR)/Messages%,mesg/Jenkins%,$(wildcard $(J_TLD)/$(J_APPDIR)/Messages*.properties))

jenkins-sync:	$(J_TLD)
	$(MAKE) jenkins-properties

jenkins-properties:	$(J_PROPERTIES)

# Not all Jenkins properties are plain ASCII, use native2ascii here to convert
# rather than simply using cp!
mesg/Jenkins%:	$(J_TLD)/$(J_APPDIR)/Messages%
	native2ascii $< $@

$(J_TLD):
	git clone $(J_URL)
	cd $(J_TLD); git checkout $(J_VERSION)
