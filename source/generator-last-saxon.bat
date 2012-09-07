java -jar saxon9he.jar -s:data.xml -xsl:build-gen.xsl -o:./build.bat -xmlversion:1.1 -strip:all full='false' processor='saxon'
sh build.bat
