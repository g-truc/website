<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="util-constants.xsl" />
  
  <xsl:output
    method="text"
    media-type="text/xml"
    version="1.0"
    encoding="utf-8"
    standalone="no"
    omit-xml-declaration="no"
    indent="yes" />

  <xsl:param name="full" select="'true'" />
  <xsl:param name="processor" select="'saxon'" />

  <xsl:template name="command-feed-saxon">
    <xsl:param name="item" />
    <xsl:param name="type" />
    <xsl:param name="serve" />

    <xsl:param name="URL" select="$item/address[@type='atom']/@url" />
    <xsl:param name="Pro" select="$item/address[@type='atom']/@processor" />
    
    <xsl:value-of select="concat('java -jar saxon9he.jar -xmlversion:1.1 -o:../', $URL, ' -s:data.xml -xsl:', $Pro, ' Filter=', $item/@name, ' serve=', $serve, '; ')" />
  </xsl:template>

  <xsl:template name="command-feed-xalan-j">
    <xsl:param name="item" />
    <xsl:param name="type" />
    <xsl:param name="serve" />
    
    <xsl:param name="URL" select="$item/address[@type='atom']/@url" />
    <xsl:param name="Pro" select="$item/address[@type='atom']/@processor" />

    <xsl:value-of select="concat('java -jar xalan.jar -OUT ../', $URL, ' -IN data.xml -XSL ', $Pro, ' -PARAM Filter ', $item/@name, ' -PARAM serve ', $serve, '; ')" />
  </xsl:template>

  <xsl:template name="command-type-saxon">
    <xsl:param name="item" />
    <xsl:param name="type" />

    <xsl:param name="URL" select="$item/address[@type='main']/@url" />
    <xsl:param name="Pro" select="$item/address[@type='main']/@processor" />

    <xsl:value-of select="concat('java -jar saxon9he.jar -xmlversion:1.1 -o:../', $URL, ' -s:data.xml -xsl:', $Pro, ' filter=', $item/@name, '; ')" />
  </xsl:template>

  <xsl:template name="command-type-xalan-j">
    <xsl:param name="item" />
    <xsl:param name="type" />

    <xsl:param name="URL" select="$item/address[@type='main']/@url" />
    <xsl:param name="Pro" select="$item/address[@type='main']/@processor" />

    <xsl:value-of select="concat('java -jar xalan.jar -OUT ../', $URL, ' -IN data.xml -XSL ', $Pro, ' -PARAM filter ', $item/@name, '; ')" />
  </xsl:template>

  <xsl:template match="item" mode="saxon">
    <xsl:param name="type" select="document($FILE_BULD)/g-truc/command-type" />

    <!-- html -->
    <xsl:call-template name="command-type-saxon">
      <xsl:with-param name="item" select="." />
      <xsl:with-param name="type" select="$type" />
    </xsl:call-template>

    <!-- feed -->
    <xsl:if test="./address[@type='atom']">
      <xsl:call-template name="command-feed-saxon">
        <xsl:with-param name="item" select="." />
        <xsl:with-param name="type" select="$type" />
        <xsl:with-param name="serve" select="'atom'" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template match="item" mode="xalan-j">
    <xsl:param name="type" select="document($FILE_BULD)/g-truc/command-type" />

    <!-- html -->
    <xsl:call-template name="command-type-xalan-j">
      <xsl:with-param name="item" select="." />
      <xsl:with-param name="type" select="$type" />
    </xsl:call-template>

    <!-- feed -->
    <xsl:if test="./address[@type='atom']">
      <xsl:call-template name="command-feed-xalan-j">
        <xsl:with-param name="item" select="." />
        <xsl:with-param name="type" select="$type" />
        <xsl:with-param name="serve" select="'atom'" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template match="command" mode="saxon">
    <xsl:choose>
      <xsl:when test="./param">
        <xsl:value-of select="concat('java -jar saxon9he.jar -xmlversion:1.1 -o:', ./@out, ' -s:', ./@xml, ' -xsl:', ./@xsl, ' ', ./param/@name,'=', ./param/@value, '; ')" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="concat('java -jar saxon9he.jar -xmlversion:1.1 -o:', ./@out, ' -s:', ./@xml, ' -xsl:', ./@xsl, '; ')" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="command" mode="xalan-j">
    <xsl:choose>
      <xsl:when test="./param">
        <xsl:value-of select="concat('java -jar xalan.jar -OUT ', ./@out, ' -IN ', ./@xml, ' -XSL ', ./@xsl, ' -PARAM ', ./param/@name, ' ', ./param/@value, '; ')" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="concat('java -jar xalan.jar -OUT ', ./@out, ' -IN ', ./@xml, ' -XSL ', ./@xsl, '; ')" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="project" mode="saxon">
    <xsl:value-of select="concat('java -jar saxon9he.jar -xmlversion:1.1 -o:../', $URL_PROJ_TOKEN, ./@index, $URL_HTML_TOKEN, ' -s:data.xml -xsl:page-project.xsl index=', ./@index, '; ')" />
  </xsl:template>

  <xsl:template match="project" mode="xalan-j">
    <xsl:value-of select="concat('java -jar xalan.jar -OUT ../', $URL_PROJ_TOKEN, ./@index, $URL_HTML_TOKEN, ' -IN data.xml -XSL page-project.xsl -PARAM index ', ./@index, '; ')" />
  </xsl:template>

  <xsl:template match="post" mode="saxon">
    <xsl:value-of select="concat('java -jar saxon9he.jar -xmlversion:1.1 -o:../', $URL_POST_TOKEN, ./@index, $URL_HTML_TOKEN, ' -s:data.xml -xsl:page-post-item.xsl index=', ./@index, '; ')" />
  </xsl:template>

  <xsl:template match="post" mode="xalan-j">
    <xsl:value-of select="concat('java -jar xalan.jar -OUT ../', $URL_POST_TOKEN, ./@index, $URL_HTML_TOKEN, ' -IN data.xml -XSL page-post-item.xsl -PARAM index ', ./@index, '; ')" />
  </xsl:template>

  <xsl:template match="draft" mode="saxon">
    <xsl:value-of select="concat('java -jar saxon9he.jar -xmlversion:1.1 -o:../', $URL_POST_TOKEN, ./@index, $URL_HTML_TOKEN, ' -s:data.xml -xsl:page-post-item.xsl draft=yes index=', ./@index, '; ')" />
  </xsl:template>

  <xsl:template match="draft" mode="xalan-j">
    <xsl:value-of select="concat('java -jar xalan.jar -OUT ../', $URL_POST_TOKEN, ./@index, $URL_HTML_TOKEN, ' -IN data.xml -XSL page-post-item.xsl -PARAM draft yes -PARAM index ', ./@index, '; ')" />
  </xsl:template>

  <xsl:template match="g-truc">
    <xsl:param name="Proj" select="document($FILE_PROJ)/g-truc/project" />
    <xsl:param name="Item" select="document($FILE_TMPL)/g-truc/item" />
    <xsl:param name="Buld" select="document($FILE_BULD)/g-truc/command" />

    <xsl:choose>
      <xsl:when test="$processor='saxon'">
        <xsl:apply-templates select="$Buld" mode="saxon" />

        <xsl:apply-templates select="./draft" mode="saxon" />

        <xsl:choose>
          <xsl:when test="$full='true'">
            <xsl:apply-templates select="./post" mode="saxon" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="./post[1]" mode="saxon" />
            <xsl:apply-templates select="./post[2]" mode="saxon" />
            <xsl:apply-templates select="./post[3]" mode="saxon" />
            <xsl:apply-templates select="./post[4]" mode="saxon" />
            <xsl:apply-templates select="./post[5]" mode="saxon" />
            <xsl:apply-templates select="./post[6]" mode="saxon" />
            <xsl:apply-templates select="./post[7]" mode="saxon" />
            <xsl:apply-templates select="./post[8]" mode="saxon" />
            <xsl:apply-templates select="./post[9]" mode="saxon" />
          </xsl:otherwise>
        </xsl:choose>

        <xsl:apply-templates select="$Item" mode="saxon" />
        <xsl:apply-templates select="$Proj" mode="saxon" />
      </xsl:when>

      <xsl:when test="$processor='xalan-j'">
        <xsl:apply-templates select="$Buld" mode="xalan-j" />

        <xsl:apply-templates select="./draft" mode="xalan-j" />

        <xsl:choose>
          <xsl:when test="$full='true'">
            <xsl:apply-templates select="./post" mode="xalan-j" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="./post[1]" mode="xalan-j" />
            <xsl:apply-templates select="./post[2]" mode="xalan-j" />
            <xsl:apply-templates select="./post[3]" mode="xalan-j" />
            <xsl:apply-templates select="./post[4]" mode="xalan-j" />
            <xsl:apply-templates select="./post[5]" mode="xalan-j" />
            <xsl:apply-templates select="./post[6]" mode="xalan-j" />
            <xsl:apply-templates select="./post[7]" mode="xalan-j" />
            <xsl:apply-templates select="./post[8]" mode="xalan-j" />
            <xsl:apply-templates select="./post[9]" mode="xalan-j" />
          </xsl:otherwise>
        </xsl:choose>

        <xsl:apply-templates select="$Item" mode="xalan-j" />
        <xsl:apply-templates select="$Proj" mode="xalan-j" />
      </xsl:when>

      <xsl:otherwise>
        <xsl:text>ERROR: Unsupported processor </xsl:text>
        <xsl:value-of select="$processor" />
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

</xsl:stylesheet>
