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
		<xsl:variable name="Template" select="document($FILE_TMPL)/g-truc" />

		<html xmlns="http://www.w3.org/1999/xhtml">
			<!-- Head -->
			<xsl:call-template name="g-truc-head">
				<xsl:with-param name="Title" select="./@title" />
			</xsl:call-template>

			<!-- Body -->
			<body>
				<div class="page">
					<!-- Title -->

					<div xmlns="http://www.w3.org/1999/xhtml" ><a id="{$ANCHOR_MENU_NAME}" class="menu-anchor"><xsl:text>♥</xsl:text></a></div>

					<div xmlns="http://www.w3.org/1999/xhtml" class="title-frame-full">
						<xsl:call-template name="title-buttons" />

						<div class="title-frame-menu">
							<h1><a class="title-frame-menu" href="http://glm.g-truc.net">GLM</a></h1>
							<p>
								OpenGL Mathematics (GLM) is a header only C++ mathematics library for graphics software based on the OpenGL Shading Language (GLSL) specifications.
							</p>
							<br />

							<h1><a class="title-frame-menu" href="http://gli.g-truc.net">GLI</a></h1>
							<p>
								OpenGL Image (GLI) is a header only C++ image library for graphics software. GLI provides classes and functions to load image files (KTX and DDS), facilitate graphics APIs texture creation, compare textures, access texture texels, sample textures, convert textures, generate mipmaps, etc.
							</p>
							<br />

							<h1><a class="title-frame-menu" href="https://github.com/g-truc/ogl-samples">OpenGL Samples Pack</a></h1>
							<p>
								The OpenGL Samples Pack is a collection of OpenGL samples based on the OpenGL "core profile" specifications. This code samples are also used to produce the <strong>OpenGL Drivers Status</strong> evaluating the quality of OpenGL drivers.
							</p>
							<ul>
								<li>OpenGL Drivers Status: <a class="title-frame-menu" href="doc/OpenGL%20Drivers%20Status.pdf">pdf (2016-07)</a>, <a class="title-frame-menu" href="doc/OpenGL%20Drivers%20Status.xlsx">xlsx (all revisions since 2012)</a></li>
							</ul>
							<br />

							<h1>OpenGL Hardware Matrix</h1>
							<p>
								Assembling contributions from experienced developers, hardware vendors, researchers, and educators, OpenGL Insights present real-world techniques for intermediate and advanced OpenGL, OpenGL ES, and WebGL developers. 
							</p>
							<ul>
								<li>OpenGL ES 3 Hardware Matrix: <a class="title-frame-menu" href="doc/OpenGL%20ES%203%20Hardware%20Matrix.pdf">pdf (2016-08)</a>, <a class="title-frame-menu" href="doc/OpenGL%20ES%203%20Hardware%20Matrix.xlsx">xlsx (all revisions since 2016)</a></li>
								<li>OpenGL 4 Hardware Matrix: <a class="title-frame-menu" href="doc/OpenGL%204%20Hardware%20Matrix.pdf">pdf (2016-04)</a>, <a class="title-frame-menu" href="doc/OpenGL%204%20Hardware%20Matrix.xlsx">xlsx (all revisions since 2012)</a></li>
								<li>OpenGL 3 Hardware Matrix: <a class="title-frame-menu" href="doc/OpenGL%203%20Hardware%20Matrix.pdf">pdf (2014-04)</a></li>
							</ul>
							<br />

							<h1><a class="title-frame-menu" href="http://openglinsights.com">OpenGL Insights</a></h1>
							<p>
								Assembling contributions from experienced developers, hardware vendors, researchers, and educators, OpenGL Insights present real-world techniques for intermediate and advanced OpenGL, OpenGL ES, and WebGL developers. Focusing on current and emerging techniques for the OpenGL family of APIs, the book demonstrates the breadth and depth of OpenGL.
							</p>
							<br />

							<h1>OpenGL Reviews</h1>
							<p>
								The OpenGL reviews have been published at the release of new OpenGL versions to highlights new features and the differences from the previous versions.
							</p>
							<ul>
								<li>OpenGL Reviews:
									<a class="title-frame-menu" href="doc/OpenGL%204.4%20review.pdf">4.4</a>, 
									<a class="title-frame-menu" href="doc/OpenGL%204.3%20review.pdf">4.3</a>, 
									<a class="title-frame-menu" href="doc/OpenGL%204.2%20review.pdf">4.2</a>, 
									<a class="title-frame-menu" href="doc/OpenGL%204.1%20review.pdf">4.1</a>, 
									<a class="title-frame-menu" href="doc/OpenGL%204.0%20review.pdf">4.0</a>, 
									<a class="title-frame-menu" href="doc/OpenGL%203.3%20review.pdf">3.3</a>
								</li>
								<li>Effective OpenGL: <a class="title-frame-menu" href="doc/Effective%20OpenGL.pdf">pdf</a> (2016-08)</li>
								<li>Candidate features for OpenGL 5 hardware: <a class="title-frame-menu" href="doc/Candidate%20features%20for%20OpenGL%205.pdf">pdf</a> (2014-05)</li>
								<li>GLSL Capabilities: <a class="title-frame-menu" href="doc/GLSL%20Capabilities.pdf">ES 2.0 to ES 3.1 and GL 3.2 to GL 4.5</a></li>
							</ul>
							<br />

							<h1><a class="title-frame-menu" href="http://openglinsights.com">OpenGL Pipeline Map</a></h1>
							<p>
								Diagrams showing the OpenGL / ES rendering pipeline in details.
							</p>
							<ul>
								<li>OpenGL 4.4 pipeline map: <a class="title-frame-menu" href="doc/OpenGL%204.4%20Pipeline%20Map.svg">svg</a>, <a class="title-frame-menu" href="doc/OpenGL%204.4%20Pipeline%20Map.pdf">pdf</a>, <a class="title-frame-menu" href="doc/OpenGL%204.4%20Pipeline%20Map.vpp">vpp</a></li>
								<li>OpenGL 4.3 pipeline map: <a class="title-frame-menu" href="doc/OpenGL%204.3%20Pipeline%20Map.pdf">pdf</a>, <a class="title-frame-menu" href="doc/OpenGL%204.3%20Pipeline%20Map.vpp">vpp</a></li>
								<li>OpenGL ES 3.0 pipeline map: <a class="title-frame-menu" href="doc/OpenGL%20ES%203.0%20Pipeline%20Map.svg">svg</a>, <a class="title-frame-menu" href="doc/OpenGL%20ES%203.0%20Pipeline%20Map.pdf">pdf</a>, <a class="title-frame-menu" href="doc/OpenGL%20ES%203.0%20Pipeline%20Map.vpp">vpp</a></li>
							</ul>
							<br />

							<h1>C++</h1>
							<ul>
								<li>C++ Compiler Matrix: language features in Clang, GCC, ICC and Visual C++. <a class="title-frame-menu" href="doc/C++%20Compiler%20Matrix.pdf">pdf (2015-09)</a>, <a class="title-frame-menu" href="doc/http://www.g-truc.net/doc/C++%20Compiler%20Matrix.pdf">xlsx (all revisions since 2015)</a></li>
								<li>Better array 'countof' implementation with C++ 11: <a class="title-frame-menu" href="post-0708.html#menu">link (2015-02)</a></li>
								<li>Robust and efficient translations in C++ using tables with zero-based enumerations: <a class="title-frame-menu" href="doc/C++%20Translations.pdf">pdf (2015-01)</a></li>
							</ul>
							<br />

							<h1><a class="title-frame-menu" href="http://openglinsights.com">Miscellaneous</a></h1>
							<ul>
								<li>OpenGL ecosystem support in Unity: <a class="title-frame-menu" href="doc/Unity%20OpenGL%20BOF.pptx">pptx (2015-04)</a></li>
								<li>Prospects for a more robust, simpler and more efficient shader cross-compilation pipeline in Unity with SPIR-V: <a class="title-frame-menu" href="doc/2015%20-%20EuroLLVM%20-%20SPIR-V.pdf">pdf (2015-04)</a></li>
								<li>Southern Islands in deep dive, Graphics and Compute combined: <a class="title-frame-menu" href="doc/Siggraph2012%20Tech%20talk.pptx">pptx (2012-08)</a></li>
								<li><a class="title-frame-menu" href="post-opengl-tips.html#menu">Blog posts archive</a></li>
							</ul>
							<br />
						</div>
					</div>
				</div>

				<xsl:call-template name="g-truc-foot" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="about">
		<div xmlns="http://www.w3.org/1999/xhtml" class="post-frame">
			<h2>
				<xsl:value-of select="$WEBSITE_TITLE" />
			</h2>
			<xsl:apply-templates />
		</div>
	</xsl:template>

</xsl:stylesheet>
