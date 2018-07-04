<?xml version="1.0" encoding="UTF-8"?>
<!--
Written and put in production 2005
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:eurofxref ="http://www.ecb.int/vocabulary/2002-08-01/eurofxref" exclude-result-prefixes="eurofxref">
<xsl:output method='xml' version='1.0' encoding='utf-8' indent='yes'/>

<xsl:template match="/*">
  <FMPXMLRESULT xmlns="http://www.filemaker.com/fmpxmlresult">
    <ERRORCODE>0</ERRORCODE>
    <PRODUCT BUILD="" NAME="" VERSION=""/>
    <DATABASE DATEFORMAT="M/d/yyyy" LAYOUT="" NAME="" RECORDS="1" TIMEFORMAT="h:mm:ss a"/>
    <METADATA>
      <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="date" TYPE="TEXT"/>
      <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="currency" TYPE="TEXT"/>
      <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="rate" TYPE="TEXT"/>
    </METADATA>
    <RESULTSET FOUND="{count(eurofxref:Cube/eurofxref:Cube/eurofxref:Cube)}">
      <xsl:apply-templates select="eurofxref:Cube/eurofxref:Cube/eurofxref:Cube"/>
    </RESULTSET>
</FMPXMLRESULT>
</xsl:template>
<xsl:template match="*[name() = 'Cube']">
<ROW xmlns="http://www.filemaker.com/fmpxmlresult" MODID="0" RECORDID="{position()}">
  <COL><DATA><xsl:value-of select="//@time"/></DATA></COL>
  <COL><DATA><xsl:value-of select="@currency"/></DATA></COL>
  <COL><DATA><xsl:value-of select="@rate"/></DATA></COL>
</ROW>
</xsl:template>

</xsl:stylesheet>
