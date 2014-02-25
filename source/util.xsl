<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:strip-space elements="*" />

  <xsl:template match="link">
    <xsl:choose>
      <xsl:when test="@class">
        <a xmlns="http://www.w3.org/1999/xhtml" href="{./@href}" class="{./@class}">
          <xsl:value-of select="." />
        </a>
      </xsl:when>
      <xsl:otherwise>
        <a xmlns="http://www.w3.org/1999/xhtml" href="{./@href}">
          <xsl:value-of select="." />
        </a>
      </xsl:otherwise>
    </xsl:choose>

    <!-- Equivalent :
    <xsl:element name="a">
      <xsl:attribute name="href"><xsl:value-of select="./@href" /></xsl:attribute>
     <xsl:value-of select="." />
    </xsl:element>
    -->
  </xsl:template>
  
  <xsl:template match="twitter">
    <a xmlns="http://www.w3.org/1999/xhtml" href="{./@href}" 
       class="{./@class}"
       data-show-count="false"
       data-text-color="402000"
       data-link-color="402000">
      <xsl:value-of select="." />
    </a>
  </xsl:template>

  <xsl:template match="text">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="meta">

  </xsl:template>

  <xsl:template match="album">

  </xsl:template>

  <xsl:template match="slide">
    <embed xmlns="http://www.w3.org/1999/xhtml"
      type="application/x-shockwave-flash"
      src="https://picasaweb.google.com/s/c/bin/slideshow.swf"
      width="{./@width}" height="{./@height}"
      flashvars="{./@href}"
      pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>
  </xsl:template>

  <xsl:template match="table-entry-element">
    <xsl:choose>
      <xsl:when test="./@color">
        <td xmlns="http://www.w3.org/1999/xhtml" class="{./@color}">
          <xsl:apply-templates />
        </td>
      </xsl:when>
      <xsl:otherwise>
        <td xmlns="http://www.w3.org/1999/xhtml" class="table-sample">
          <xsl:apply-templates />
        </td>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="table-entry">
    <tr xmlns="http://www.w3.org/1999/xhtml">
      <xsl:apply-templates />
    </tr>
  </xsl:template>

  <xsl:template match="table-title-element">
    <xsl:choose>
      <xsl:when test="./@class">
        <th xmlns="http://www.w3.org/1999/xhtml" class="{./@class}">
          <xsl:value-of select="." />
        </th>
      </xsl:when>
      <xsl:otherwise>
        <th xmlns="http://www.w3.org/1999/xhtml">
          <xsl:value-of select="." />
        </th>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="table-title">
    <tr xmlns="http://www.w3.org/1999/xhtml" class="title">
      <xsl:apply-templates />
    </tr>
  </xsl:template>

  <xsl:template match="table">
    <table xmlns="http://www.w3.org/1999/xhtml" class="status">
      <xsl:apply-templates />
    </table>
  </xsl:template>

  <xsl:template match="paragraph">
    <p xmlns="http://www.w3.org/1999/xhtml">
      <xsl:choose>
        <xsl:when test="./@href">
          <a href="{./@href}"><xsl:apply-templates /></a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </p>
  </xsl:template>

  <xsl:template match="quiz">
    <div xmlns="http://www.w3.org/1999/xhtml" >
      <iframe frameborder="0" width="100%" height="1200" scrolling="auto" allowtransparency="true" src="http://groovounet.polldaddy.com/s/opengl-quiz?iframe=1">
        <a href="http://groovounet.polldaddy.com/s/{@id}">View Survey</a>
      </iframe>
    </div>
  </xsl:template>

  <xsl:template match="poll">
    <div xmlns="http://www.w3.org/1999/xhtml" >
      <script 
        type="text/javascript" charset="utf-8" 
        src="{concat('http://static.polldaddy.com/p/', ./@id, '.js')}">
        <xsl:text> </xsl:text>
      </script>
      <noscript>
        <a href="{concat('http://polldaddy.com/poll/', ./@id, '/')}">
          <xsl:value-of select="./@title"/>
        </a>
      </noscript>
    </div>
  </xsl:template>

  <xsl:template match="survey">
    <div xmlns="http://www.w3.org/1999/xhtml" >
      <iframe src="{./@href}" width="800" height="1000" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>
    </div>
  </xsl:template>

  <xsl:template match="bold">
    <span xmlns="http://www.w3.org/1999/xhtml" class="bold">
      <xsl:choose>
        <xsl:when test="./@href">
          <a href="{./@href}">
            <xsl:apply-templates />
          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </span>
  </xsl:template>

  <xsl:template match="source-list">
    <ul xmlns="http://www.w3.org/1999/xhtml">
      <xsl:apply-templates />
    </ul>
  </xsl:template>

  <xsl:template match="source-element">
    <li xmlns="http://www.w3.org/1999/xhtml">
      <xsl:value-of select="./@type"/>
      <xsl:text>: </xsl:text>
      <a href="{./@href}">
        <xsl:value-of select="./@title"/>
      </a>
    </li>
  </xsl:template>

  <xsl:template match="source-download">
    <xsl:param name="Index" select="./@index" />
    <xsl:param name="Download" select="document($FILE_DOWN)/g-truc/download[@index=$Index]" />
    <xsl:param name="Project" select="document($FILE_PROJ)/g-truc/project[@type=$Download/@type]" />

    <li xmlns="http://www.w3.org/1999/xhtml">
      <xsl:text>Download: </xsl:text>
      <a href="{concat($URL_PROJ_TOKEN, $Project/@index, $URL_HTML_TOKEN, $ANCHOR_MENU_LINK)}">
        <xsl:value-of select="$Project/@name" />
      </a>
      <xsl:text> </xsl:text>
      <a href="{$Download/item[1]/@href}">
          <xsl:value-of select="$Download/@version" />
      </a>
      <xsl:for-each select="$Download/item">
        <xsl:text> (</xsl:text>
        <a href="{./@href}">
          <xsl:value-of select="./@type"/>
          <xsl:if test="./@size">
            <xsl:text>, </xsl:text>
            <xsl:value-of select="./@size"/>
          </xsl:if>
        </a>
        <xsl:text>) </xsl:text>
      </xsl:for-each>
    </li>
  </xsl:template>

  <xsl:template match="image-list">
    <div xmlns="http://www.w3.org/1999/xhtml" class="post-image-list">
      <xsl:apply-templates select="./image-element" />
    </div>
  </xsl:template>

  <xsl:template match="image-element">
    <a xmlns="http://www.w3.org/1999/xhtml" href="{./@normal}">
      <img src="{./@small}" alt="{./@title}" />
    </a>
  </xsl:template>

  <xsl:template match="image">
    <xsl:choose>
      <xsl:when test="contains(./@color, 'white')">
        <div xmlns="http://www.w3.org/1999/xhtml" class="post-image-white">
          <a href="{./@href}">
            <img src="{./@img}" alt="{./@title}" />
          </a>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <div xmlns="http://www.w3.org/1999/xhtml" class="post-image-black">
          <a href="{./@href}">
            <img src="{./@img}" alt="{./@title}" />
          </a>
        </div>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="./@title">
      <div xmlns="http://www.w3.org/1999/xhtml" class="post-image-title">
        <xsl:value-of select="./@title"/>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="video">
    <div xmlns="http://www.w3.org/1999/xhtml" class="post-image">
      <object width="{./@width}" height="{./@height}">
        <param name="movie" value="{./@href}"> </param>
        <param name="allowFullScreen" value="true"> </param>
        <param name="allowscriptaccess" value="always"> </param>
        <embed
           src="{./@href}"
           type="application/x-shockwave-flash"
           allowfullscreen="true"
           allowScriptAccess="always"
           width="{./@width}" height="{./@height}">
        </embed>
      </object>
    </div>
    <xsl:if test="./@title">
      <div xmlns="http://www.w3.org/1999/xhtml" class="post-image-title">
        <xsl:value-of select="./@title"/>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="post" mode="photo-menu-index">
    <div xmlns="http://www.w3.org/1999/xhtml" class="slideshow">
      <a href="{./image/@href}">
        <img src="{./image/@img}" alt="{./image/@href}" />
      </a>
    </div>
  </xsl:template>

  <xsl:template match="list">
    <div xmlns="http://www.w3.org/1999/xhtml" class="list">
      <xsl:if test="./@title">
        <xsl:choose>
          <xsl:when test="./@href">
            <span class="list">
              <a href="{./@href}">
                <xsl:value-of select="./@title" />
              </a>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <span class="list">
              <xsl:value-of select="./@title" />
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
      <ul class="list">
        <xsl:apply-templates select="./list-element"/>
        <xsl:apply-templates select="./entry"/>
      </ul>
    </div>
  </xsl:template>

  <xsl:template match="list-element">
    <li xmlns="http://www.w3.org/1999/xhtml" class="list">
      <xsl:choose>
        <xsl:when test="./@href">
          <a href="{./@href}">
            <xsl:apply-templates />
          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </li>
  </xsl:template>

  <xsl:template match="entry">
    <li xmlns="http://www.w3.org/1999/xhtml" class="list">
      <xsl:choose>
        <xsl:when test="./@href">
          <a href="{./@href}">
            <xsl:apply-templates />
          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </li>
  </xsl:template>

  <xsl:template match="title">
    <h4 xmlns="http://www.w3.org/1999/xhtml">
      <xsl:choose>
        <xsl:when test="./@href">
          <a href="{./@href}">
            <xsl:apply-templates />
          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </h4>
  </xsl:template>

  <xsl:template match="subtitle">
    <h5 xmlns="http://www.w3.org/1999/xhtml">
      <xsl:choose>
        <xsl:when test="./@href">
          <a href="{./@href}">
            <xsl:apply-templates />
          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </h5>
  </xsl:template>

  <xsl:template match="quote">
    <p xmlns="http://www.w3.org/1999/xhtml" class="quote">
      <xsl:apply-templates />
      <xsl:if test="./@author">
        <span class="quote-author">
          <xsl:choose>
            <xsl:when test="@href">
              <a href="{./@href}">
                <xsl:value-of select="./@author" />
              </a>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="./@author" />
            </xsl:otherwise>
          </xsl:choose>
        </span>
      </xsl:if>
    </p>
  </xsl:template>

  <xsl:template match="code">
    <div xmlns="http://www.w3.org/1999/xhtml" class="code">
      <xsl:choose>
        <xsl:when test="./@href">
          <span class="code-title">
            <a href="{./@href}">
              <xsl:value-of select="./@author" />
            </a>
          </span>
        </xsl:when>
        <xsl:otherwise>
          <span class="code-title">
            <xsl:value-of select="./@title" />
          </span>
        </xsl:otherwise>
      </xsl:choose>
      <ul class="code-list">
        <xsl:apply-templates select="./line" />
      </ul>
    </div>
  </xsl:template>

  <xsl:template match="line">
    <li xmlns="http://www.w3.org/1999/xhtml" class="code-line">
      <xsl:choose>
        <xsl:when test="@align">
          <span class="code-line-content" style="padding-left:{@align}">
            <xsl:apply-templates />
          </span>
        </xsl:when>
        <xsl:otherwise>
          <span class="code-line-content">
            <xsl:apply-templates />
          </span>
        </xsl:otherwise>
      </xsl:choose>
    </li>
  </xsl:template>

  <xsl:template match="keyword">
    <span xmlns="http://www.w3.org/1999/xhtml" class="keyword">
      <xsl:choose>
        <xsl:when test="./@href">
          <a href="{./@href}">
            <xsl:apply-templates />
          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </span>
  </xsl:template>

  <xsl:template match="userword">
    <span xmlns="http://www.w3.org/1999/xhtml" class="userword">
      <xsl:choose>
        <xsl:when test="./@href">
          <a href="{./@href}">
            <xsl:apply-templates />
          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </span>
  </xsl:template>

  <xsl:template match="codeword">
    <span xmlns="http://www.w3.org/1999/xhtml" class="codeword">
      <xsl:choose>
        <xsl:when test="./@href">
          <a href="{./@href}">
            <xsl:apply-templates />
          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </span>
  </xsl:template>

  <xsl:template match="string">
    <span xmlns="http://www.w3.org/1999/xhtml" class="string">
      <xsl:apply-templates />
    </span>
  </xsl:template>

  <xsl:template match="comment">
    <span xmlns="http://www.w3.org/1999/xhtml" class="comment">
      <xsl:apply-templates />
    </span>
  </xsl:template>

  <xsl:template match="align">
    <span xmlns="http://www.w3.org/1999/xhtml" class="align">
      <xsl:apply-templates />
    </span>
  </xsl:template>

  <!-- Share posts on social network -->
  <xsl:template name="share">
    <xsl:param name="title" />
    <xsl:param name="href" />
    <xsl:param name="Theme" />
    <xsl:param name="Type" select="'gtc'" />

    <h3 xmlns="http://www.w3.org/1999/xhtml" class="share">
      <xsl:choose>
        <xsl:when test="contains($Type, $FILTER_CREA_TOKEN)">
          <a href="{$WEBSITE_FEED_CREA}" class="{$Theme}">
            <xsl:text>RSS Feed</xsl:text>
          </a>
        </xsl:when>
        <xsl:when test="contains($Type, $FILTER_TECH_TOKEN)">
          <a href="{$WEBSITE_FEED_TECH}" class="{$Theme}">
            <xsl:text>RSS Feed</xsl:text>
          </a>
        </xsl:when>
        <xsl:otherwise>
          <a href="{$WEBSITE_FEED}" class="{$Theme}">
            <xsl:text>RSS Feed</xsl:text>
          </a>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text> ~ Comment: </xsl:text>
      <a href="mailto:{$WEBSITE_EMAIL}?subject={./@title}" class="{$Theme}">
        <xsl:text>by email</xsl:text>
      </a>
      <xsl:text> - </xsl:text>
      <a href="http://twitter.com/g_truc" class="{$Theme}">
        <xsl:text>on Twitter</xsl:text>
      </a>
      <xsl:text> ~ Share: </xsl:text>
      <a href="http://twitter.com/home?status=#g_truc {$title} {$href}" class="{$Theme}" title="Click to share this post on Twitter" data-via="g_truc" target="_blank">
        <xsl:text>Twitter</xsl:text>
      </a>
      <xsl:text> - </xsl:text>
      <a href="http://www.facebook.com/share.php?u={$href}" class="{$Theme}" title="Click to share this post on Facebook">
        <xsl:text>Facebook</xsl:text>
      </a>
      <xsl:text> - </xsl:text>
      <a href="http://www.linkedin.com/shareArticle?mini=true&amp;url={$href}&amp;title={$title}&amp;summary={$title}&amp;source='Christophe Riccio'" class="{$Theme}">
        <xsl:text>Linked In</xsl:text>
      </a>
      <xsl:text> - </xsl:text>
      <a href="https://plusone.google.com/_/+1/confirm?mini=true&amp;url={$href}&amp;title={$title}&amp;content={$title}" class="{$Theme}">
        <xsl:text>Google+</xsl:text>
      </a>
      <xsl:text> - </xsl:text>
      <a href="{$href}" class="{$Theme}">
        <xsl:text>Permanent link</xsl:text>
      </a>
    </h3>
  </xsl:template>

</xsl:stylesheet>
