#
# Some simple (right...) help code.
# XXX Need multiple language support. (index-{sv,en,...}.html)
#

#
# Helper functions
#

HTML_SPECIAL_ESCAPE_SED=	"s/&/\&amp;/g;s/</\&lt;/g;"
#SPACE_HTML_ESCAPE_SED=		"s,\\ ,\\&nbsp;,g;"
#LINE_TO_STRING_SED=		"s,^.*$$,\"&\",; s,\`,\\\`,g;"
HTML_ESCAPE_COMMAND=		$(SED) -e $(HTML_SPECIAL_ESCAPE_SED)


#
# Package information
#

PACKAGE_HTML=	echo "<html>" \
		"<head><title>"$(DISTNAME) $(VERSION)$(EXTRAVERSION)$(COMPILER_TAG)"</title></head>" \
		"<body>"; \
		$(UPLINKS_HTML) \
		echo "<h1>Package $(DISTNAME)/$(VERSION)$(EXTRAVERSION)$(COMPILER_TAG)</h1>"; \
		$(DESCRIPTION_HTML) \
		$(REFERENCES_HTML) \
		echo "<h2>Module</h2><p>The module name is &quot;<kbd>$(DISTNAME)/$(VERSION)$(EXTRAVERSION)$(COMPILER_TAG)</kbd>&quot;.<p>"; \
		$(USAGE_HTML) \
		echo "</body></html>";

UPLINKS_HTML=	echo "<p>[ <a href=\"../../index.html\">Packages</a>: Versions of package <a href=\"../index.html\">$(DISTNAME)</a>: Version $(VERSION)$(EXTRAVERSION)$(COMPILER_TAG) ]</p>";

ifdef DESCRIPTION
DESCRIPTION_HTML=echo "<h2>Description</h2><p>" ;\
		echo $(DESCRIPTION) | $(HTML_ESCAPE_COMMAND) ;\
		echo "</p>";
endif

REFERENCES_HTML=echo "<h2>More information</h2><ul>" \
		"<li><a href=\"$(HOMEPAGE)\">Package homepage</a>" \
		"<li><a href=\"$(MAINTAINER)\">Maintainer - $(MAINTAINER)</a>" \
		"</ul>";

#		"<li><a href=\"info2html/index.html\">Package documentation</a>" \
#		"<li><a href=\"man2html/index.html\">Package manpages</a>" \

ifdef USAGE_COMMAND
USAGETEXT_HTML=	echo "<samp>> </samp><kbd>$(USAGE_COMMAND)</kbd><pre>"; \
		($(MODULE_ADD) $(DISTNAME)/$(VERSION)$(EXTRAVERSION)$(COMPILER_TAG) && $(USAGE_COMMAND) 2>&1 | $(HTML_ESCAPE_COMMAND)); \
		echo "</pre>";
endif

ifdef USAGETEXT_HTML
USAGE_HTML=		echo "<h2>Usage</h2>"; $(USAGE_TEXT_HTML)
endif

MODULE_SHOW_HTML=	echo "<pre>"; ($(CAT) $(MODULEDIR)/$(DISTNAME)/$(VERSION)$(EXTRAVERSION)$(COMPILER_TAG) | $(GREP) -v "^$$" | $(HTML_ESCAPE_COMMAND)); echo "</pre>";

# Markdown output
PACKAGE_MARKDOWN=	echo "\# $(DISTNAME) $(VERSION)$(EXTRAVERSION)$(COMPILER_TAG)"; \
			echo "" ;\
			echo "\#\# Description " ;\
			echo "" ;\
			$(DESCRIPTION_MARKDOWN) \
			echo "" ;\
			echo "\#\# References" ;\
			echo "" ;\
			$(REFERENCES_MARDKWON) ;\
			echo "" ;\
			echo "\#\# Extra information " ;\
			echo "" ;\
			echo "* Configured with: $(CONFIGURED_MARKDOWN)" ;\
			echo "* Build depends: module load $(BUILD_DEP_MARKDOWN)" ;\
			echo "* Run depends: module load $(RUN_DEP_MARKDOWN)" ;\
			echo "* Link depends: module load $(LINK_DEP_MARKDOWN)" ;\
			echo "* Internal module depends: $(MODULE_DEP_MARKDOWN)" ;
			echo "" ;\

DESCRIPTION_MARKDOWN=	echo $(DESCRIPTION) | $(HTML_ESCAPE_COMMAND) ;
			echo "" ;\
REFERENCES_MARDKWON=	echo "* Package homepage: <$(HOMEPAGE)>" ; \
			echo "* Maintainer: <$(MAINTAINER)>"
			echo "" ;\

CONFIGURED_MARKDOWN=	$(CONFIGURE_SCRIPT) $(CONFIGURE_ARGS)
BUILD_DEP_MARKDOWN=	$(BUILD_DEPENDS)
RUN_DEP_MARKDOWN=	$(RUN_DEPENDS)
MODULE_DEP_MARKDOWN=	$(MODULE_DEPENDS)
LINK_DEP_MARKDOWN=	$(LINK_DEPENDS)
