<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="g-truc-title-full">
    <xsl:param name="filter" />

    <div xmlns="http://www.w3.org/1999/xhtml" class="title-frame">
      <ul xmlns="http://www.w3.org/1999/xhtml" class="title-list-button">
        <!--li class="title-list-button-search">
            <a class="title-list-button-search" href="search.html">.</a>
          </li-->
      </ul>

      <a id="{$ANCHOR_MENU_NAME}" class="menu-anchor">
        <xsl:text>♥</xsl:text>
      </a>

      <div class="title-frame-menu">
        <div class="title-frame-shadow">
          <xsl:text>♥</xsl:text>
        </div>
        
        <xsl:choose>
          <!-- index-crea.html -->
          <xsl:when test="starts-with($filter, $FILTER_CREA_TOKEN)">
            <xsl:call-template name="crea-side">
              <xsl:with-param name="filter" select="$filter"/>
            </xsl:call-template>
            <xsl:call-template name="crea-menu">
              <xsl:with-param name="filter" select="$filter"/>
            </xsl:call-template>
            <div class="title-frame-crea-extend">
              <a class="title-frame-extend" href="index.html#menu">
                <xsl:text>-</xsl:text>
              </a>
            </div>
            <div class="title-frame-search-extend">
              <a class="title-frame-extend" href="search.html#menu">
                <xsl:text>*</xsl:text>
              </a>
            </div>
            <div class="title-frame-tech-extend">
              <a class="title-frame-extend" href="index-tech.html#menu">
                <xsl:text>+</xsl:text>
              </a>
            </div>
          </xsl:when>

          <!-- index-tech.html -->
          <xsl:when test="starts-with($filter, $FILTER_TECH_TOKEN)">
            <xsl:call-template name="tech-menu">
              <xsl:with-param name="filter" select="$filter"/>
            </xsl:call-template>
            <xsl:call-template name="tech-side">
              <xsl:with-param name="filter" select="$filter"/>
            </xsl:call-template>
            <div class="title-frame-crea-extend">
              <a class="title-frame-extend" href="index-crea.html#menu">
                <xsl:text>+</xsl:text>
              </a>
            </div>
            <div class="title-frame-search-extend">
              <a class="title-frame-extend" href="search.html#menu">
                <xsl:text>*</xsl:text>
              </a>
            </div>
            <div class="title-frame-tech-extend">
              <a class="title-frame-extend" href="index.html#menu">
                <xsl:text>-</xsl:text>
              </a>
            </div>
          </xsl:when>
          
          <!-- index.html -->
          <xsl:otherwise>
            <xsl:call-template name="crea-side">
              <xsl:with-param name="filter" select="$filter"/>
            </xsl:call-template>
            <xsl:call-template name="tech-side">
              <xsl:with-param name="filter" select="$filter"/>
            </xsl:call-template>
            <div class="title-frame-crea-extend">
              <a class="title-frame-extend" href="index-crea.html#menu">
                <xsl:text>+</xsl:text>
              </a>
            </div>
            <div class="title-frame-search-extend">
              <a class="title-frame-extend" href="search.html#menu">
                <xsl:text>*</xsl:text>
              </a>
            </div>
            <div class="title-frame-tech-extend">
              <a class="title-frame-extend" href="index-tech.html#menu">
                <xsl:text>+</xsl:text>
              </a>
            </div>
          </xsl:otherwise>
        </xsl:choose>
      </div>
      <div style="clear:both; color:transparent;">
        <xsl:text>♥</xsl:text>
      </div>
    </div>
  </xsl:template>

  <!-- Menu Crea -->
  <xsl:template match="post" mode="title-frame-crea">
    <xsl:param name="href" select="concat($URL_POST_TOKEN, ./@index, $URL_HTML_TOKEN, $ANCHOR_MENU_LINK)" />

    <li xmlns="http://www.w3.org/1999/xhtml" class="title-frame-crea">
      <a href="{$href}" class="title-frame">
        <xsl:value-of select="./@title"/>
        <xsl:text> </xsl:text>
      	<xsl:value-of select="./@date"/>
      </a>
    </li>
  </xsl:template>

  <xsl:template match="post" mode="title-frame-crea-shadow">
    <xsl:param name="href" select="concat($URL_POST_TOKEN, ./@index, $URL_HTML_TOKEN, $ANCHOR_MENU_LINK)" />
    
    <li xmlns="http://www.w3.org/1999/xhtml" class="title-frame-crea">
      <a href="{$href}" class="title-frame-shadow">
        <xsl:value-of select="./@title"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="./@date"/>
      </a>
    </li>
  </xsl:template>

  <xsl:template name="crea-side">
    <xsl:param name="Post" select="document($FILE_POST)/g-truc/post" />
    <xsl:param name="Item" select="document($FILE_TMPL)/g-truc/item" />
    
    <xsl:param name="PostSelected" select="$Post[./meta/tag[contains(., $FILTER_CREA_TOKEN)]][$MENU_POST_COUNT>=position()]" />

    <ul xmlns="http://www.w3.org/1999/xhtml" class="title-frame-crea-shadow">
      <xsl:apply-templates select="$PostSelected" mode="title-frame-crea-shadow" />
    </ul>
    <ul xmlns="http://www.w3.org/1999/xhtml" class="title-frame-crea">
      <xsl:apply-templates select="$PostSelected" mode="title-frame-crea" />
    </ul>
  </xsl:template>

  <xsl:template name="crea-menu">
    <xsl:param name="filter" />
    
    <xsl:param name="Post" select="document($FILE_POST)/g-truc/post" />

    <xsl:param name="Post1" select="$Post[./meta/tag='gtc-crea-photography'][1]" />
    <xsl:param name="Post2" select="$Post[./meta/tag='gtc-crea-photography'][2]" />
    <xsl:param name="Post3" select="$Post[./meta/tag='gtc-crea-photography'][3]" />
    <xsl:param name="Post4" select="$Post[./meta/tag='gtc-crea-photography'][4]" />

    <div xmlns="http://www.w3.org/1999/xhtml" class="title-frame-crea-menu">
      <div class="title-frame-crea-menu-extended">

        <span class="title-frame-crea-extend-picture">
          <a href="{concat($URL_POST_TOKEN, $Post1/@index, $URL_HTML_TOKEN)}" 
             class="page-index-photo-title" 
             style="{concat('background-image:url(', $Post1/album/preview/@pic144, ');')}">
            <xsl:text>♥</xsl:text>
          </a>
        </span>
        <span class="title-frame-crea-extend-picture">
          <a href="{concat($URL_POST_TOKEN, $Post2/@index, $URL_HTML_TOKEN)}" 
             class="page-index-photo-title" 
             style="{concat('background-image:url(', $Post2/album/preview/@pic144, ');')}">
            <xsl:text>♥</xsl:text>
          </a>
        </span>
        <span class="title-frame-crea-extend-picture">
          <a href="{concat($URL_POST_TOKEN, $Post3/@index, $URL_HTML_TOKEN)}"
             class="page-index-photo-title"
             style="{concat('background-image:url(', $Post3/album/preview/@pic144, ');')}">
            <xsl:text>♥</xsl:text>
          </a>
        </span>
        <span class="title-frame-crea-extend-picture">
          <a href="{concat($URL_POST_TOKEN, $Post4/@index, $URL_HTML_TOKEN)}"
             class="page-index-photo-title"
             style="{concat('background-image:url(', $Post4/album/preview/@pic144, ');')}">
            <xsl:text>♥</xsl:text>
          </a>
        </span>

        <span class="title-frame-crea-extend-menu-buttons">
          <span class="title-frame-crea-extend-button-block">
            <xsl:call-template name="tech-menu-button-url">
              <xsl:with-param name="Href" select="'photo.html'"/>
              <xsl:with-param name="Title" select="'Albums'"/>
              <xsl:with-param name="Class" select="'title-frame-crea-extend-button-entry'"/>
            </xsl:call-template>
            <xsl:call-template name="tech-menu-button-url">
              <xsl:with-param name="Href" select="'http://picasaweb.google.com/groovounet'"/>
              <xsl:with-param name="Title" select="'Picasa'"/>
              <xsl:with-param name="Class" select="'title-frame-crea-extend-button-entry'"/>
            </xsl:call-template>
            <xsl:call-template name="tech-menu-button-link">
              <xsl:with-param name="Token" select="'gtc-crea-photography'"/>
              <xsl:with-param name="Class" select="'title-frame-crea-extend-button-entry'"/>
            </xsl:call-template>
            <xsl:call-template name="tech-menu-button-link">
              <xsl:with-param name="Token" select="'gtc-crea-exhibition'"/>
              <xsl:with-param name="Class" select="'title-frame-crea-extend-button-entry'"/>
            </xsl:call-template>
            <xsl:call-template name="tech-menu-button-link">
              <xsl:with-param name="Token" select="'gtc-crea-performance'"/>
              <xsl:with-param name="Class" select="'title-frame-crea-extend-button-entry'"/>
            </xsl:call-template>
          </span>
          <span class="title-frame-crea-extend-button-shadow">
            <xsl:call-template name="tech-menu-button-url">
              <xsl:with-param name="Href" select="'photo.html'"/>
              <xsl:with-param name="Title" select="'Albums'"/>
              <xsl:with-param name="Class" select="'title-frame-crea-extend-button-shadow'"/>
            </xsl:call-template>
            <xsl:call-template name="tech-menu-button-url">
              <xsl:with-param name="Href" select="'http://picasaweb.google.com/groovounet'"/>
              <xsl:with-param name="Title" select="'Picasa'"/>
              <xsl:with-param name="Class" select="'title-frame-crea-extend-button-shadow'"/>
            </xsl:call-template>
            <xsl:call-template name="tech-menu-button-link">
              <xsl:with-param name="Token" select="'gtc-crea-photography'"/>
              <xsl:with-param name="Class" select="'title-frame-crea-extend-button-shadow'"/>
            </xsl:call-template>
            <xsl:call-template name="tech-menu-button-link">
              <xsl:with-param name="Token" select="'gtc-crea-exhibition'"/>
              <xsl:with-param name="Class" select="'title-frame-crea-extend-button-shadow'"/>
            </xsl:call-template>
            <xsl:call-template name="tech-menu-button-link">
              <xsl:with-param name="Token" select="'gtc-crea-performance'"/>
              <xsl:with-param name="Class" select="'title-frame-crea-extend-button-shadow'"/>
            </xsl:call-template>
          </span>
        </span>
      </div>
    </div>
  </xsl:template>

  <!-- Menu Tech -->
  <xsl:template match="post" mode="title-frame-tech">
    <xsl:param name="Href" select="concat($URL_POST_TOKEN, ./@index, $URL_HTML_TOKEN, $ANCHOR_MENU_LINK)" />
    
    <li xmlns="http://www.w3.org/1999/xhtml" class="title-frame-tech">
      <a href="{$Href}" class="title-frame">
      	<xsl:value-of select="./@date"/>
      	<xsl:text> </xsl:text>
        <xsl:value-of select="./@title"/>
      </a>
    </li>
  </xsl:template>

  <xsl:template match="post" mode="title-frame-tech-shodow">
    <xsl:param name="Href" select="concat($URL_POST_TOKEN, ./@index, $URL_HTML_TOKEN, $ANCHOR_MENU_LINK)" />

    <li xmlns="http://www.w3.org/1999/xhtml" class="title-frame-tech">
      <a href="{$Href}" class="title-frame-shadow">
      	<xsl:value-of select="./@date"/>
      	<xsl:text> </xsl:text>
        <xsl:value-of select="./@title"/>
      </a>
    </li>
  </xsl:template>

  <xsl:template name="tech-side">
    <xsl:param name="filter" />

    <xsl:param name="Post" select="document($FILE_POST)/g-truc/post" />
    <xsl:param name="Item" select="document($FILE_TMPL)/g-truc/item" />
    
    <xsl:param name="PostSelected" select="$Post[./meta/tag[contains(., $FILTER_TECH_TOKEN)]][$MENU_POST_COUNT>=position()]" />

    <ul xmlns="http://www.w3.org/1999/xhtml" class="title-frame-tech-shadow">
      <xsl:apply-templates select="$PostSelected" mode="title-frame-tech-shodow" />
    </ul>
    <ul xmlns="http://www.w3.org/1999/xhtml" class="title-frame-tech">
      <xsl:apply-templates select="$PostSelected" mode="title-frame-tech" />
    </ul>
  </xsl:template>

  <xsl:template name="tech-menu">
    <xsl:param name="filter" />

    <div xmlns="http://www.w3.org/1999/xhtml" class="title-frame-tech-extend-button">
      <xsl:call-template name="tech-menu-button-hack">
        <xsl:with-param name="Class" select="'title-frame-tech-extend-button-hidden'"/>
      </xsl:call-template>
      
      <div class="title-frame-tech-extend-button-block">
        <xsl:call-template name="tech-menu-button-project">
          <xsl:with-param name="Token" select="'gtc-tech-opengl-samples'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-project">
          <xsl:with-param name="Token" select="'gtc-tech-project-glm'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-project">
          <xsl:with-param name="Token" select="'gtc-tech-project-gli'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>

        <xsl:call-template name="tech-menu-button-project">
          <xsl:with-param name="Token" select="'gtc-tech-project-openglreviews'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-project">
          <xsl:with-param name="Token" select="'gtc-tech-project-openglstatus'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-project">
          <xsl:with-param name="Token" select="'gtc-tech-project-openglmatrix'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-link">
          <xsl:with-param name="Token" select="'gtc-tech-project-openglpipeline'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-link">
          <xsl:with-param name="Token" select="'gtc-tech-project-openglinsights'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>
      </div>
      <div class="title-frame-tech-extend-button-shadow">
        <xsl:call-template name="tech-menu-button-project">
          <xsl:with-param name="Token" select="'gtc-tech-opengl-samples'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-project">
          <xsl:with-param name="Token" select="'gtc-tech-project-glm'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-project">
          <xsl:with-param name="Token" select="'gtc-tech-project-gli'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>

        <xsl:call-template name="tech-menu-button-project">
          <xsl:with-param name="Token" select="'gtc-tech-project-openglreviews'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-project">
          <xsl:with-param name="Token" select="'gtc-tech-project-openglstatus'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-project">
          <xsl:with-param name="Token" select="'gtc-tech-project-openglmatrix'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-link">
          <xsl:with-param name="Token" select="'gtc-tech-project-openglpipeline'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-link">
          <xsl:with-param name="Token" select="'gtc-tech-project-openglinsights'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>
      </div>
    </div>

  </xsl:template>

  <xsl:template name="tech-menu-button-hack">
    <xsl:param name="Class" />

    <xsl:param name="Template" select="document($FILE_TMPL)/g-truc" />
    <xsl:param name="item" select="$Template/item" />
    <xsl:param name="link" select="./@link" />

    <span xmlns="http://www.w3.org/1999/xhtml" class="title-frame-tech-extend-button-entry">
      <a href="{concat($item[@name=$link]/address[./@type='main']/@url, $ANCHOR_MENU_LINK)}" class="title-frame-tech-extend-button-hidden">
        <xsl:text>♥</xsl:text>
      </a>
    </span>
  </xsl:template>

  <xsl:template name="tech-menu-button-url">
    <xsl:param name="Class" />
    <xsl:param name="Href" />
    <xsl:param name="Title" />

    <span xmlns="http://www.w3.org/1999/xhtml" class="title-frame-tech-extend-button-entry">
      <a href="{$Href}" class="{$Class}">
        <xsl:value-of select="$Title" />
      </a>
    </span>
  </xsl:template>

  <xsl:template name="tech-menu-button-link">
    <xsl:param name="Class" />
    <xsl:param name="Token" />

    <xsl:param name="Item" select="document($FILE_TMPL)/g-truc/item[@name=$Token]" />
    <xsl:param name="Href" select="concat($Item/address[./@type='main']/@url, $ANCHOR_MENU_LINK)" />

    <span xmlns="http://www.w3.org/1999/xhtml" class="title-frame-tech-extend-button-entry">
      <a href="{$Href}" class="{$Class}">
        <xsl:value-of select="$Item/@title" />
      </a>
    </span>
  </xsl:template>

  <xsl:template name="tech-menu-button-project">
    <xsl:param name="Class" />
    <xsl:param name="Token" />

    <xsl:param name="Download" select="document($FILE_DOWN)/g-truc/download[@type=$Token][1]" />
    <xsl:param name="Project" select="document($FILE_PROJ)/g-truc/project[@type=$Token]" />

    <xsl:param name="Href" select="concat($URL_PROJ_TOKEN, $Project/@index, $URL_HTML_TOKEN, $ANCHOR_MENU_LINK)" />

    <span xmlns="http://www.w3.org/1999/xhtml" class="title-frame-tech-extend-button-entry">
      <a href="{$Href}" class="{$Class}">
        <xsl:choose>
          <xsl:when test="$Project/@short">
            <xsl:value-of select="$Project/@short" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$Project/@name" />
          </xsl:otherwise>
        </xsl:choose>
      </a>
      <xsl:text> (</xsl:text>
      <a href="{$Download/item/@href}" class="{$Class}">
        <xsl:value-of select="$Download/@version" />
      </a>
      <xsl:text>)</xsl:text>
    </span>
  </xsl:template>

</xsl:stylesheet>
