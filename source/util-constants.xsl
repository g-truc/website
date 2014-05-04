<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!--xsl:variable name="HTML_NS">http://www.w3.org/1999/xhtml</xsl:variable>
  <xsl:variable name="ATOM_NS">http://www.w3.org/2005/Atom</xsl:variable-->
  
  <xsl:variable name="WEBSITE_URL">http://www.g-truc.net/</xsl:variable>
  <xsl:variable name="WEBSITE_AUTHOR">Christophe Riccio</xsl:variable>
  <xsl:variable name="WEBSITE_EMAIL">mail@g-truc.net</xsl:variable>
  <xsl:variable name="WEBSITE_TITLE">G-Truc Creation</xsl:variable>
  <xsl:variable name="WEBSITE_COPYRIGHT">2002-2014</xsl:variable>
  <xsl:variable name="WEBSITE_FEED">http://feeds.feedburner.com/g-truc</xsl:variable>
  <xsl:variable name="WEBSITE_FEED_CREA">http://feeds.feedburner.com/gtc-crea</xsl:variable>
  <xsl:variable name="WEBSITE_FEED_TECH">http://feeds.feedburner.com/gtc-tech</xsl:variable>
  <xsl:variable name="WEBSITE_FEED_CREA_TITLE">Creative</xsl:variable>
  <xsl:variable name="WEBSITE_FEED_TECH_TITLE">Technical</xsl:variable>

  <xsl:variable name="FILE_POST">data.xml</xsl:variable>
  <xsl:variable name="FILE_PROJ">project.xml</xsl:variable>
  <xsl:variable name="FILE_DOWN">download.xml</xsl:variable>
  <xsl:variable name="FILE_TMPL">template.xml</xsl:variable>
  <xsl:variable name="FILE_BULD">build.xml</xsl:variable>

  <xsl:variable name="URL_POST_TOKEN">post-</xsl:variable>
  <xsl:variable name="URL_PROJ_TOKEN">project-</xsl:variable>
  <xsl:variable name="URL_HTML_TOKEN">.html</xsl:variable>

  <xsl:variable name="ANCHOR_MENU_NAME">menu</xsl:variable>
  <xsl:variable name="ANCHOR_MENU_LINK">#menu</xsl:variable>
  <xsl:variable name="ANCHOR_PICTURE_NAME">picture</xsl:variable>
  <xsl:variable name="ANCHOR_PICTURE_LINK">#picture</xsl:variable>
  
  <xsl:variable name="MENU_POST_COUNT">7</xsl:variable>

  <xsl:variable name="FILTER_CREA_TOKEN">gtc-crea</xsl:variable>
  <xsl:variable name="FILTER_TECH_TOKEN">gtc-tech</xsl:variable>

  <xsl:variable name="THEME_NAME_ORANGE">orange</xsl:variable>
  <xsl:variable name="THEME_CURRENT"><xsl:value-of select="$THEME_NAME_ORANGE"/></xsl:variable>

  <xsl:param name="filter" select="'none'" />
	<xsl:param name="post-other-photography-album-id" select="'gtc-crea-photography'" />
  <xsl:param name="post-other-photograph-id" select="'gtc-crea-photograph'" />

</xsl:stylesheet>
