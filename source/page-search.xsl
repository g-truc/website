<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="util-constants.xsl" />
	<xsl:include href="util.xsl" />
  <xsl:include href="util-html.xsl" />
  <xsl:include href="util-head.xsl" />
  <xsl:include href="util-webgl.xsl" />
  <xsl:include href="util-foot.xsl" />
  <xsl:include href="util-title.xsl" />
	<xsl:include href="util-directory.xsl" />

	<xsl:template match="g-truc">
    <xsl:param name="Item" select="document($FILE_TMPL)/g-truc/item" />
    
		<html xmlns="http://www.w3.org/1999/xhtml">
			<!-- Head -->
      <xsl:call-template name="g-truc-head">
        <xsl:with-param name="Title" select="'Search'" />
      </xsl:call-template>

			<body>
				<div class="page-search">
					<!-- Title -->
					<xsl:call-template name="g-truc-title">
						<xsl:with-param name="filter" select="'home'"/>
					</xsl:call-template>

          <!-- Frame -->
          <span class="post-frame-list">
            <h2>
              <a href="{concat('post.html', $ANCHOR_MENU_LINK)}">
                <xsl:text>Search on G-Truc Creation</xsl:text>
              </a>
            </h2>

            <xsl:call-template name="google" />
            <div style="clear:both; color:transparent">
              <xsl:text>♥</xsl:text>
            </div>
          </span>
          <ul class="post-frame-menu">
            <li class="post-frame-menu-level0">
              <a href="{concat('search.html', $ANCHOR_MENU_LINK)}">
                <xsl:text>Search</xsl:text>
              </a>
            </li>
            <xsl:apply-templates select="$Item" mode="post-list-menu" />
          </ul>

          <!-->div class="post-frame">
            <h2>
              <a href="{concat('post.html', $ANCHOR_MENU_LINK)}">
                <xsl:text>Search on G-Truc Creation</xsl:text>
              </a>
            </h2>

            <xsl:call-template name="google" />
            <div style="clear:both; color:transparent">
              <xsl:text>♥</xsl:text>
            </div>
					</div-->
				</div>

        <!-- Footer -->
        <xsl:call-template name="g-truc-foot" />
			</body>
		</html>
	</xsl:template>

  <xsl:template name="google">
		<div xmlns="http://www.w3.org/1999/xhtml" class="content-search">
			<div id="cse" style="width:100%;">
        <xsl:text>Loading</xsl:text>
      </div>
			<script src="http://www.google.com/jsapi" type="text/javascript">
        <xsl:text>♥</xsl:text>
      </script>
			<script type="text/javascript">
				google.load('search', '1');
				google.setOnLoadCallback(function(){
				new google.search.CustomSearchControl('014535526063376021179:4t1ynnpwlcy').draw('cse');
				}, true);
			</script>
		</div>
	</xsl:template>

</xsl:stylesheet>
