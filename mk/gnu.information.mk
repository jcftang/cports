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
		"<head><title>"$(DISTNAME) $(VERSION)"</title></head>" \
		"<body>"; \
		$(UPLINKS_HTML) \
		echo "<h1>Package $(DISTNAME)/$(VERSION)</h1>"; \
		$(DESCRIPTION_HTML) \
		$(REFERENCES_HTML) \
		echo "<h2>Module</h2><p>The module name is &quot;<kbd>$(DISTNAME)/$(VERSION)</kbd>&quot;.<p>"; \
		$(USAGE_HTML) \
		echo "</body></html>";

UPLINKS_HTML=	echo "<p>[ <a href=\"../../index.html\">Packages</a>: Versions of package <a href=\"../index.html\">$(DISTNAME)</a>: Version $(VERSION) ]</p>";

ifdef DESCRIPTION
DESCRIPTION_HTML=echo "<h2>Description</h2><p>$(DESCRIPTION)</p>";
endif

REFERENCES_HTML=echo "<h2>More information</h2><ul>" \
		"<li><a href=\"$(HOMEPAGE)\">Package homepage</a>" \
		"<li><a href=\"info2html/index.html\">Package documentation</a>" \
		"<li><a href=\"man2html/index.html\">Package manpages</a>" \
		"</ul>";

ifdef USAGE_COMMAND
USAGETEXT_HTML=	echo "<samp>> </samp><kbd>$(USAGE_COMMAND)</kbd><pre>"; \
		($(MODULE_ADD) $(DISTNAME)/$(VERSION) && $(USAGE_COMMAND) 2>&1 | $(HTML_ESCAPE_COMMAND)); \
		echo "</pre>";
endif

ifdef USAGETEXT_HTML
USAGE_HTML=		echo "<h2>Usage</h2>"; $(USAGE_TEXT_HTML)
endif

#MODULE_SHOW_HTML=	echo "<pre>"; ($(CAT) $(MODULEDIR)/$(DISTNAME)/$(VERSION) | $(GREP) -v "^$$" | $(HTML_ESCAPE_COMMAND)); echo "</pre>";
