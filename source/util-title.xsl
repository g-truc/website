<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="g-truc-title">
		<xsl:param name="filter" />

		<div xmlns="http://www.w3.org/1999/xhtml" >
			<a id="{$ANCHOR_MENU_NAME}" class="menu-anchor">
				<xsl:text>♥</xsl:text>
			</a>
		</div>

		<div xmlns="http://www.w3.org/1999/xhtml" class="title-frame">
			<xsl:call-template name="title-buttons" />
		
			<div style="clear:both; color:transparent;">
				<xsl:text>♥</xsl:text>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="g-truc-title-full">
		<xsl:param name="filter" />

		<div xmlns="http://www.w3.org/1999/xhtml" >
			<a id="{$ANCHOR_MENU_NAME}" class="menu-anchor">
				<xsl:text>♥</xsl:text>
			</a>
		</div>

		<div xmlns="http://www.w3.org/1999/xhtml" class="title-frame-full">
			<xsl:call-template name="title-buttons" />

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
					</xsl:when>

					<!-- index-tech.html -->
					<xsl:when test="starts-with($filter, $FILTER_TECH_TOKEN)">
						<xsl:call-template name="tech-menu">
							<xsl:with-param name="filter" select="$filter"/>
						</xsl:call-template>
						<xsl:call-template name="tech-side">
							<xsl:with-param name="filter" select="$filter"/>
						</xsl:call-template>
					</xsl:when>

					<!-- index.html -->
					<xsl:otherwise>
						<xsl:call-template name="crea-side">
							<xsl:with-param name="filter" select="$filter"/>
						</xsl:call-template>
						<xsl:call-template name="tech-side">
								<xsl:with-param name="filter" select="$filter"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div style="clear:both; color:transparent;">
				<xsl:text>♥</xsl:text>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="title-buttons">
		<a href="./index.html#menu">
			<svg class="title-nav" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				width="32px" height="32px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve" style="stroke:#FFFFFF; fill:#FFFFFF; fill-opacity=0.5; stroke-opacity=0.5">

				<path id="home-4-icon" d="M419.492,275.815v166.213H300.725v-90.33h-89.451v90.33H92.507V275.815H50L256,69.972l206,205.844H419.492
					z M394.072,88.472h-47.917v38.311l47.917,48.023V88.472z"/>
			</svg>
		</a>

		<a href="./search.html#menu">
			<svg class="title-nav" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				width="32px" height="32px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve" style="stroke:#FFFFFF; fill:#FFFFFF; fill-opacity=0.5; stroke-opacity=0.5">

				<path id="magnifier-icon" d="M460.475,408.443L351.4,299.37c15.95-25.137,25.2-54.923,25.2-86.833
					C376.601,122.914,303.687,50,214.062,50c-89.623,0-162.537,72.914-162.537,162.537s72.914,162.537,162.537,162.537
					c30.326,0,58.733-8.356,83.055-22.876L406.918,462L460.475,408.443z M112.117,212.537c0-56.213,45.732-101.946,101.945-101.946
					 c56.213,0,101.947,45.733,101.947,101.946s-45.733,101.945-101.947,101.945C157.849,314.482,112.117,268.75,112.117,212.537z"/>
			</svg>
		</a>

		<a href="./photo.html#menu">
			<svg class="title-nav" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				width="32px" height="32px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve" style="stroke:#FFFFFF; fill:#FFFFFF; fill-opacity=0.5; stroke-opacity=0.5">

				<path id="picture-icon" d="M142.843,202.59c0-16.86,13.671-30.53,30.531-30.53s30.53,13.67,30.53,30.53
					c0,16.862-13.67,30.53-30.53,30.53S142.843,219.452,142.843,202.59z M297.696,203.567l-50.608,71.905l-27.504-28.349l-77.604,88.174
					h242.578L297.696,203.567z M422,140.5v231H90v-231H422 M462,100.5H50v311h412V100.5L462,100.5z"/>
			</svg>
		</a>

		<a href="http://www.twitter.com/g_truc">
			<svg class="title-link" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				width="48px" height="48px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve" style="stroke:#FFFFFF; fill:#FFFFFF; fill-opacity=0.5; stroke-opacity=0.5">

				<path id="twitter-3-icon" d="M412,50H100c-27.614,0-50,22.386-50,50v312c0,27.614,22.386,50,50,50h312c27.614,0,50-22.386,50-50V100
					C462,72.386,439.614,50,412,50z M371.942,207.125c3.553,79.059-55.408,167.203-159.768,167.203
					c-31.743,0-61.289-9.305-86.164-25.253c29.821,3.515,59.586-4.758,83.218-23.278c-24.596-0.453-45.356-16.703-52.508-39.035
					c8.808,1.684,17.473,1.19,25.383-0.962c-27.03-5.433-45.692-29.784-45.083-55.826c7.577,4.211,16.245,6.74,25.46,7.032
					c-25.034-16.73-32.12-49.786-17.396-75.045c27.723,34.006,69.143,56.385,115.857,58.729c-8.199-35.16,18.474-69.019,54.755-69.019
					c16.168,0,30.776,6.825,41.029,17.75c12.804-2.52,24.833-7.198,35.694-13.639c-4.197,13.126-13.11,24.141-24.715,31.098
					c11.37-1.357,22.204-4.379,32.284-8.851C392.454,189.301,382.926,199.201,371.942,207.125z" />
			</svg>
		</a>

		<a href="http://www.g-truc.net/post.atom">
			<svg class="title-link" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				width="48px" height="48px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve" style="stroke:#FFFFFF; fill:#FFFFFF; fill-opacity=0.5; stroke-opacity=0.5">

				<path id="rss-square-rounded-icon" d="M412,50H100c-27.614,0-50,22.386-50,50v312c0,27.614,22.386,50,50,50h312
					c27.614,0,50-22.386,50-50V100C462,72.386,439.614,50,412,50z M151.005,400.2c-21.554,0-39.026-17.472-39.026-39.026
					c0-21.553,17.473-39.024,39.026-39.024s39.024,17.472,39.024,39.024C190.029,382.729,172.559,400.2,151.005,400.2z M244.268,400.2
					c-0.747-72.618-59.672-131.542-132.289-132.288v-57.815c104.663,0.747,189.355,85.44,190.104,190.103H244.268z M342.201,400.2
					c-0.174-61.521-24.205-119.335-67.728-162.856c-43.436-43.437-101.108-67.456-162.495-67.723V111.8
					c158.955,0.556,287.681,129.401,288.043,288.4H342.201z"/>
			</svg>
		</a>

		<a href="https://github.com/g-truc">
			<svg class="title-link" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				width="48px" height="48px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve" style="stroke:#FFFFFF; fill:#FFFFFF; fill-opacity=0.5; stroke-opacity=0.5">

				<path id="github-2-square-rounded-icon" d="M163.979,317.334c0,0.984-1.125,1.781-2.512,1.781s-2.511-0.797-2.511-1.781
					c0-0.983,1.124-1.781,2.511-1.781S163.979,316.351,163.979,317.334z M156.401,310.297c-1.248,0-2.26,0.719-2.26,1.604
					s1.012,1.603,2.26,1.603c1.247,0,2.259-0.718,2.259-1.603S157.648,310.297,156.401,310.297z M167.335,320.854
					c-1.541,0-2.791,0.888-2.791,1.98c0,1.094,1.25,1.979,2.791,1.979c1.539,0,2.789-0.885,2.789-1.979
					C170.124,321.741,168.874,320.854,167.335,320.854z M151.801,305.797c-1.067,0-1.933,0.613-1.933,1.371
					c0,0.757,0.865,1.369,1.933,1.369c1.066,0,1.933-0.612,1.933-1.369C153.733,306.41,152.867,305.797,151.801,305.797z
					M147.067,302.064c-0.91,0-1.648,0.524-1.648,1.17c0,0.645,0.738,1.168,1.648,1.168c0.909,0,1.647-0.523,1.647-1.168
					C148.715,302.589,147.977,302.064,147.067,302.064z M142.401,299.115c-0.819,0-1.483,0.471-1.483,1.053
					c0,0.58,0.664,1.051,1.483,1.051c0.818,0,1.482-0.471,1.482-1.051C143.884,299.586,143.22,299.115,142.401,299.115z
					M175.269,325.832c-1.713,0-3.101,0.986-3.101,2.201s1.388,2.199,3.101,2.199c1.711,0,3.1-0.984,3.1-2.199
					S176.979,325.832,175.269,325.832z M205.7,329.266c-1.711,0-3.1,0.986-3.1,2.201s1.389,2.199,3.1,2.199
					c1.713,0,3.101-0.984,3.101-2.199S207.413,329.266,205.7,329.266z M462,100v312c0,27.614-22.386,50-50,50H100
					c-27.614,0-50-22.386-50-50V100c0-27.614,22.386-50,50-50h312C439.614,50,462,72.386,462,100z M420.801,250.66
					c-18.316-1.777-36.534-1.936-54.231-0.584c2.845-9.078,4.344-19.332,4.235-30.992c-0.233-24.771-8.493-44.064-21.474-60.076
					c2.492-15.082,0.614-30.162-4.09-45.249c-18.549,1.519-35.242,7.594-50.107,18.148c-27.779-5.635-55.557-5.995-83.337,0
					c-17.339-11.702-34.364-17.441-51.128-18.148c-4.969,16.612-5.734,32.987-1.533,49.086c-14.624,15.518-20.214,34.355-19.939,55.215
					c0.156,11.941,1.996,22.567,5.391,31.961c-17.438-1.279-35.361-1.108-53.387,0.639l0.295,3.055
					c18.357-1.782,36.607-1.929,54.336-0.542c0.65,1.579,1.306,3.151,2.053,4.653c-19.208-0.507-36.494,1.162-52.684,5.143l0.73,2.979
					c16.432-4.038,34.033-5.664,53.686-5.003c12.997,23.091,38.017,36.659,74.451,40.964c-8.465,6.875-13.016,14.985-14.188,24.161
					c0,0-3.83,0-19.297,0c-25.915,0-32.98-33.043-59.822-29.784c26.04,12.914,20.84,54.193,62.51,54.193c14.004,0,16.98,0,17.506,0
					v37.837c0.186,6.114-2.476,10.203-6.775,13.038c14.924,1.506,26.139-5.944,26.139-15.084c0-9.141,0-45.559,0-50.014
					c0-4.456,4.666-4.801,4.666-4.801v58.395c0.197,5.811-2.627,9.113-5.625,12.271c13.147,0.523,25.514-2.103,26.074-13.292
					c0,0,0-53.076,0-55.887c0-2.81,4.604-2.879,4.604,0s0,53.265,0,53.265c0.136,9.44,8.289,17.094,25.562,15.914
					c-4.621-3.72-6.039-7.479-6.039-12.921c0-5.439,0-57.744,0-57.744s4.761-0.244,4.761,4.801c0,5.044,0,40.264,0,48.704
					c0,10.84,13.013,15.312,27.863,14.892c-4.865-3.646-8.158-7.992-8.179-13.805v-58.572c-0.503-8.609-4.003-16.726-10.866-24.287
					c33.305-5.113,57.311-18.408,69.264-42.236c19.717-0.678,37.371,0.945,53.845,4.996l0.731-2.979
					c-16.314-4.01-33.744-5.676-53.133-5.131c0.671-1.513,1.336-3.032,1.91-4.629c17.912-1.438,36.366-1.297,54.928,0.506
					L420.801,250.66z M185.101,328.732c-1.711,0-3.1,0.986-3.1,2.201c0,1.214,1.389,2.199,3.1,2.199c1.713,0,3.1-0.985,3.1-2.199
					C188.2,329.719,186.813,328.732,185.101,328.732z M195.468,329.066c-1.713,0-3.1,0.986-3.1,2.201c0,1.213,1.387,2.199,3.1,2.199
					c1.711,0,3.1-0.986,3.1-2.199C198.567,330.053,197.179,329.066,195.468,329.066z"/>
			</svg>
		</a>

		<div style="clear:both; color:transparent;">
			<xsl:text>♥</xsl:text>
		</div>
	</xsl:template>

	<!-- Menu Crea -->
	<xsl:template match="post" mode="title-frame-crea">
		<xsl:param name="href" select="concat($URL_POST_TOKEN, ./@index, $URL_HTML_TOKEN, $ANCHOR_PICTURE_LINK)" />

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
        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'GLM'"/>
          <xsl:with-param name="Href" select="'http://glm.g-truc.net'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'GLI'"/>
          <xsl:with-param name="Href" select="'http://gli.g-truc.net'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'OpenGL Samples'"/>
          <xsl:with-param name="Href" select="'https://github.com/g-truc/ogl-samples'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>

        <xsl:call-template name="tech-menu-button-project">
          <xsl:with-param name="Token" select="'gtc-tech-project-openglreviews'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-project">
          <xsl:with-param name="Token" select="'gtc-tech-project-openglpipeline'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'OpenGL Insights'"/>
          <xsl:with-param name="Href" select="'http://openglinsights.com'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>

        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'OpenGL Drivers Status'"/>
          <xsl:with-param name="Href" select="'doc/OpenGL%20Drivers%20Status.pdf'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'OpenGL 4 Hardware Matrix'"/>
          <xsl:with-param name="Href" select="'doc/OpenGL%204%20Hardware%20Matrix.pdf'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'OpenGL 3 Hardware Matrix'"/>
          <xsl:with-param name="Href" select="'doc/OpenGL%203%20Hardware%20Matrix.pdf'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>

        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'C++ Compiler Status'"/>
          <xsl:with-param name="Href" select="'doc/C++%20Compiler%20Status.pdf'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'Documents'"/>
          <xsl:with-param name="Href" select="'doc.html'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-entry'"/>
        </xsl:call-template>
      </div>
      <div class="title-frame-tech-extend-button-shadow">
        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'GLM'"/>
          <xsl:with-param name="Href" select="'http://glm.g-truc.net'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'GLI'"/>
          <xsl:with-param name="Href" select="'http://gli.g-truc.net'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'OpenGL Samples'"/>
          <xsl:with-param name="Href" select="'https://github.com/g-truc/ogl-samples'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>

        <xsl:call-template name="tech-menu-button-project">
          <xsl:with-param name="Token" select="'gtc-tech-project-openglreviews'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-project">
          <xsl:with-param name="Token" select="'gtc-tech-project-openglpipeline'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'OpenGL Insights'"/>
          <xsl:with-param name="Href" select="'http://openglinsights.com'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>

        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'OpenGL Drivers Status'"/>
          <xsl:with-param name="Href" select="'doc/OpenGL%20Drivers%20Status.pdf'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'OpenGL 4 Hardware Matrix'"/>
          <xsl:with-param name="Href" select="'doc/OpenGL%204%20Hardware%20Matrix.pdf'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'OpenGL 3 Hardware Matrix'"/>
          <xsl:with-param name="Href" select="'doc/OpenGL%203%20Hardware%20Matrix.pdf'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>

        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'C++ Compiler Status'"/>
          <xsl:with-param name="Href" select="'doc/C++%20Compiler%20Status.pdf'"/>
          <xsl:with-param name="Class" select="'title-frame-tech-extend-button-shadow'"/>
        </xsl:call-template>
        <xsl:call-template name="tech-menu-button-url">
          <xsl:with-param name="Title" select="'Documents'"/>
          <xsl:with-param name="Href" select="'doc.html'"/>
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

		<xsl:param name="Project" select="document($FILE_PROJ)/g-truc/project[@type=$Token]" />
		<xsl:param name="Download" select="document($FILE_DOWN)/g-truc/download[@type=$Token][1]" />

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
		</span>
	</xsl:template>

</xsl:stylesheet>
