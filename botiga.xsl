<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <head>
    <script src="https://kit.fontawesome.com/3e4c1a6931.js" crossorigin="anonymous"></script>
    <style>
      .A2009 {
        background-color: lightblue;
      }
      .A2010 {
        background-color: yellow;
      }
      .A2007 {
        background-color: red;
      }
      .A2005 {
        background-color: lightgreen;
      }
    </style>
  </head>
  <body>
    <h2>Exercici de la botiga</h2>
    <table border="1">
      <tr>
        <th>Titol</th>
        <th>Director</th>
        <th>Preu</th>
        <th>Any</th>
        <th>Idioma</th>
      </tr>
      <xsl:for-each select="botiga/bluray">
      <tr class="A{any}">
        <td><a href="https://www.imdb.com/find?q={titol}"><xsl:value-of select="titol" /></a></td>
        <td><xsl:value-of select="director" /></td>
        <td><xsl:value-of select="preu" /> <xsl:apply-templates select="preu" /></td>
        <td><xsl:value-of select="any" /></td>
        <td>
            <img src="{titol/@idioma}.jpg" height="20px" width="20px" ></img>
        </td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

<xsl:template match="preu" >
  <xsl:choose>
    <xsl:when test=".  &gt; 15" >
      <i class="fa-solid fa-money-bills"></i>
    </xsl:when>
    <xsl:otherwise>
      <i class="fa-solid fa-money-bill"></i>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>