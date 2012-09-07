java -jar xalan.jar -XSLTC -IN ./data.xml -OUT ./build.bat -XSL ./build-gen.xsl -PARAM full false -PARAM processor xalan-j
sh build.bat
