<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
    <head>
      <style>
        svg {
          border: 1px solid black;
        }
      </style>
    </head>
    <body>
      <svg width="{dibuix/canvas/amplada}" height="{dibuix/canvas/alçada}" xmlns="http://www.w3.org/2000/svg">
        <xsl:for-each select="dibuix/figures/figura">
          <xsl:choose>
            <xsl:when test="@tipus = 'rectangle'">
              <rect class="figura" x="{posicio/x}" y="{posicio/y}" width="{dimensions/amplada}" height="{dimensions/alçada}" fill="{@color}" stroke="{@bora}" />
            </xsl:when>
            <xsl:when test="@tipus = 'cercle' "> 
              <circle class="figura" r="{posicio/r}" cx="{posicio/cx}" cy="{posicio/cy}" fill="{@color}" stroke="{@bora}"/>
            </xsl:when>
            <xsl:when test="@tipus = 'ellipse' "> 
              <ellipse class="figura" ry="{posicio/ry}" rx="{posicio/rx}" cx="{posicio/cx}" cy="{posicio/cy}" height="{dimensions/alçada}" width="{dimensions/amplada}" fill="{@color}" stroke="{@bora}"/>
            </xsl:when>
          <xsl:when test="@tipus = 'text'">
              <text class="figura" x="{posicio/x}" y="{posicio/y}" width="{dimensions/amplada}" height="{dimensions/alçada}" fill="{@color}" stroke="{@bora}"> <xsl:value-of select="posicio/text" /> </text>
          </xsl:when>
        </xsl:choose>
        </xsl:for-each>
      </svg>
      <input type="button" value="Change Color"  onclick="canviarColor()" />
      <script>
        function canviarColor() {
          var figures = document.getElementsByClassName("figura");
          var len = figures.length;
          
          for(var i=0 ; i &lt; len; i++){
            figures[i].setAttribute("fill", "black");
        }
      }
      </script>
    </body>
  </html>
</xsl:template>


</xsl:stylesheet>