<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template name="g-truc-foot">
    <div xmlns="http://www.w3.org/1999/xhtml" class="page-foot">
      <div>
        <a href="info.html" class="page-foot">
          <xsl:text>Copyright © </xsl:text>
          <xsl:value-of select="$WEBSITE_AUTHOR" />
          <xsl:text> </xsl:text>
          <xsl:value-of select="$WEBSITE_COPYRIGHT" />
          <xsl:text> all rights reserved</xsl:text>
        </a>
      </div>
      <div>
        <xsl:text>Designed for </xsl:text>
        <a href="http://www.google.com/chrome" class="page-foot">Chrome 9</a>,
        <a href="http://www.mozilla.com/firefox/new/" class="page-foot">Firefox 4</a>,
        <a href="http://www.opera.com/" class="page-foot">Opera 11</a> and 
        <a href="http://www.apple.com/safari" class="page-foot">Safari 5</a>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>
