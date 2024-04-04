<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <head>
      <style>
        html, body {
          height: 100%;
          margin: 0;
          padding: 0;
          font-size: 18px;
        }

        .dies {
          background-color: gainsboro ;
          text-align: center;
          padding: 5px;
          font-weight: bold;
        }

        .M01 {
          background-color: <xsl:value-of select="/horari/colors/color[@codi='M01']"/> ;
          padding: 10px;
          border: 1px solid gainsboro;
          text-align: center;
        }
        
        .M02 {
          background-color: <xsl:value-of select="/horari/colors/color[@codi='M02']"/> ;
          padding: 10px;
          border: 1px solid gainsboro;
          text-align: center;
        }

        .M03 {
          background-color: <xsl:value-of select="/horari/colors/color[@codi='M03']"/> ;
          padding: 10px;
          border: 1px solid gainsboro;
          text-align: center;
        }

        .M04 {
          background-color: <xsl:value-of select="/horari/colors/color[@codi='M04']"/> ;
          padding: 10px;
          border: 1px solid gainsboro;
          text-align: center;
        }

        .M08 {
          background-color: <xsl:value-of select="/horari/colors/color[@codi='M08']"/> ;
          padding: 10px;
          border: 1px solid gainsboro;
          text-align: center;
        }

        .M09 {
          background-color: <xsl:value-of select="/horari/colors/color[@codi='M09']"/> ;
          padding: 10px;
          border: 1px solid gainsboro;
          text-align: center;
        }

        .M10 {
          background-color: <xsl:value-of select="/horari/colors/color[@codi='M10']"/> ;
          padding: 10px;
          border: 1px solid gainsboro;
          text-align: center;
        }

        .M11 {
          background-color: <xsl:value-of select="/horari/colors/color[@codi='M11']"/> ;
          padding: 10px;
          border: 1px solid gainsboro;
          text-align: center;
        }


        footer h1 {
          text-align: center;
          font-size: 30px;
        }

        footer p {
          text-align: center;
          font-size: 18px;
        }

        footer p a {
          color: black;
        }

        .container {
          display: flex;
          flex-direction: row;
          flex-wrap: nowrap;
          width: 100%;
        }

        .moduls {
          display: flex;
          flex-direction: column;
          flex-wrap: nowrap;
          border: 2px solid gainsboro;
          width: 100%; 
        }

      </style>
    </head>
    <body>
        <header>
          <img src="{/horari/@header}" width="100%" height="170px"/>
        </header>
        
        <div class="container">
        <xsl:for-each select="/horari/setmana/dia">
          <div class="moduls">
            <div class="dies"><xsl:value-of select="@nom"/></div>
            <xsl:for-each select="modul">
              <div class="{codi}">
                <xsl:value-of select="codi" /><xsl:text> </xsl:text> <xsl:value-of select="nom" /> 
              </div>
            </xsl:for-each>
          </div>
        </xsl:for-each>
        </div>

        <footer>
          <h1><xsl:value-of select="/horari/links/@nom" /></h1>
          <xsl:for-each select="/horari/links/link">
            
            <xsl:sort select="nom" />
            <p><a href="{url}"><xsl:value-of select="nom"/></a></p>

          </xsl:for-each>
        </footer>
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>