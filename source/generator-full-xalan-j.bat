java -jar xalan.jar -XSLTC -IN ./data.xml -OUT ./build.bat -XSL ./build-gen.xsl -PARAM full 'true' -PARAM processor 'xalan-j'
sh build.bat
