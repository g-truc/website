<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

		<xsl:template match="style" mode="head">
			<link xmlns="{$HTML_NS}" href="{.}" rel="stylesheet" media="screen" type="text/css" />
		</xsl:template>

		<xsl:template match="script" mode="head">
		<xsl:choose>
			<xsl:when test="./@href">
				<script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{./@href}">
					<xsl:text> </xsl:text>
				</script>
			</xsl:when>
			<xsl:otherwise>
				<script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript">
					<xsl:value-of select="." />
				</script>
			</xsl:otherwise>
		</xsl:choose>
		</xsl:template>

		<xsl:template name="g-truc-head">
		<xsl:param name="Index" />
		<xsl:param name="Template" select="document($FILE_TMPL)/g-truc" />
		<xsl:param name="Post" select="document($FILE_POST)/g-truc/post" />
		<xsl:param name="Title" select="$Post[@index=$Index]/@title" />

		<head xmlns="http://www.w3.org/1999/xhtml">
			<title>
				<xsl:choose>
					<xsl:when test="$Title">
						<xsl:value-of select="$Title" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$WEBSITE_TITLE" />
					</xsl:otherwise>
				</xsl:choose>
			</title>

			<script>
				!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
				<xsl:text> </xsl:text>
			</script>
			<script src="//cdn.webglstats.com/stat.js" defer="defer" async="async"></script>
			<script type="text/javascript">
				/* <![CDATA[ */
				(function() {
					var s = document.createElement('script'), t = document.getElementsByTagName('script')[0];
					s.type = 'text/javascript';
					s.async = true;
					s.src = 'http://api.flattr.com/js/0.6/load.js?mode=auto';
					t.parentNode.insertBefore(s, t);
				})();
				/* ]]> */
				<xsl:text> </xsl:text>
			</script>
			<script type="text/javascript">
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-20182250-1']);
			_gaq.push(['_setDomainName', '.g-truc.net']);
			_gaq.push(['_trackPageview']);

			(function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			})();
			<xsl:text> </xsl:text>
			</script>
			<xsl:apply-templates select="$Post[./@index=$Index]/webgl/script" mode="head" />

			<meta http-equiv="Content-Language" content="en" />
			<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=iso-8859-1" />
			<meta name="right" content="{$WEBSITE_COPYRIGHT}" />
			<meta name="keywords" content="{$WEBSITE_AUTHOR} OpenGL OpenCL GLSL C++ XML Graphics Rendering Photography GeForce Radeon" />
			<xsl:apply-templates select="$Template/theme[@name=$THEME_CURRENT]/style" mode="head" />
			<link href="{$WEBSITE_FEED}" title="{$Template/about/title}" rel="alternate" type="application/atom+xml" />
			<link href="{$WEBSITE_FEED_CREA}" title="{concat($Template/about/title, ' ', $WEBSITE_FEED_CREA_TITLE)}" rel="alternate" type="application/atom+xml" />
			<link href="{$WEBSITE_FEED_TECH}" title="{concat($Template/about/title, ' ', $WEBSITE_FEED_TECH_TITLE)}" rel="alternate" type="application/atom+xml" />
			<link href="{$Template/theme[@name=$THEME_CURRENT]/@favicon}" rel="shortcut icon"/>
			<link href="{$Template/theme[@name=$THEME_CURRENT]/@favicon-apple}" rel="apple-touch-icon" />
		</head>
	</xsl:template>
</xsl:stylesheet>

 