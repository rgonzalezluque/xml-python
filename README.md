# xml-python
Aquest repositori és una recopilació dels meus apunts sobre les tecnològies que hem après a la UF2 de M04 Llenguatge de Marques durant el primer curs d'ASIX al Institut Joaquim Mir.

## *DOM*
### Què és *DOM* (Model d'objectes de document)?
*Dom* és una representació estructurada d'un document HTML/XML que el navegador pot interpretar i manipular. El DOM és essencial per a la creació de pàgines web interactives i dinàmiques.

![maxresdefault](https://github.com/rgonzalezluque/xml-python/assets/165800646/403aa4e1-ab09-4a3f-bbf2-9c767ba3b61d)

Més informació a: https://developer.mozilla.org/es/docs/Web/API/Document_Object_Model/Introduction
### Com recórrer *DOM*?
**Propietats**:
* Firstchild: primer fill
* Lastchild: últim fill
* nodeName: nom del node o element
* nodeValue: valor del node o element
* tagName: nom de l'etiqueta
* getAttribute(): conseguir valor de un atribut
* getElementsbyTagName(): pots treballar amb elements que tenen la mateixa etiqueta com una llista

Tipus d'**objectes**: 
* Element
* Attr
* Comment
* Text
* ProcessingInsruction

Exemple de codi amb DOM
```python
from xml.dom import minidom
doc = minidom.parse("XML.xml")
listaPersonas = doc.getElementsByTagName("person")
```
En aquest exemple fem una llista dels elements amb l'etiqueta "person". Aquesta llista després la podrem recórrer.
### Python aplicat a DOM

**Minidom**: mòdul de python per obtindre dades de xml a través de Python

Linea per a importar minidom a *Python*:
```python
from xml.dom import minidom
```

#### Bucle FOR
Un bucle for és una estructura de control en la programación que s'usa per repetir un bloc de codi un nombre determinat de vegades. És una manera eficient de 
manejar tasques repetitives, com iterar sobre els elements d'una llista o realitzar càlculs repetits. Els bucles for són una eina potent per manejar tasques 
repetitives i són útils en el context del DOM per manipular elements HTML en una pàgina web de manera eficient.

Exemple de bucle for:
```python
diccionariColors = dict()
colors = doc.getElementsByTagName("colors")[0].getElementsByTagName("assignatura")
for x in colors:
    diccionariColors[x.firstChild.data] = x.getAttribute("color")
print(diccionariColors)
```
En aquest exemple utilitzem un bucle for per obtindre el atribut del color de cada assignatura.

## XSLT I XPATH
### Què és XSLT?
**XSLT** (eXtensible Stylesheet Language Transformations) és un llenguatge per transformar documents XML en altres documents XML o en altres tipus de documents
com ara HTML, text pla o en format XSL-FO (que després pot ser convertit a PDF, PostScript i/o PNG).

![image](https://github.com/rgonzalezluque/xml-python/assets/165800646/e441bc0a-42b2-4161-b8c3-1930d3c4263b)

### Sintaxis de XSLT
Per vincular un XSLT a un arxiu XML hem d'escriure el següent codi al XML:
```xml
<?xml-stylesheet type="text/xsl" href="horari.xsl"?>
```
Per declarar un arxiu XSL hem d'escriure el següent codi:
```xslt
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
```
Els XSL disposen de diferents elements que podem utilitzar depenent dels nostres objectius:
* Element <xsl:template>
S'utilitza per crear plantilles.
```xslt
<xsl:template match="/">
```
En aquest exemple creem una plantilla per l'arrel del xml.

* Element <xsl:value-of>
S'utilitza per extreure el valor d'un node seleccionat.
```xslt
<xsl:value-of select="/horari/links/@nom"/>
```
En aquest exemple s'utilitza per extreure el valor del atribut nom del node links que té com a element arrel a horari.

* Element <xsl:for-each>
S'utilitza per seleccionar tots els elements XML d'un conjunt de nodes especificat.
```xslt
<xsl:for-each select="catalog/cd">
    <tr>
        <td><xsl:value-of select="title" /></td>
        <td><xsl:value-of select="artist" /></td>
        <td><xsl:value-of select="country" /></td>
    </tr>
</xsl:for-each>
```
En aquest exemple s'utilitza per extreure el valor de les etiquetes "title", "artist" i "country" de cada cd.

* Element <xsl:sort>
S'utilitza per ordenar la sortida de un element <xsl:for-each>
```xslt
<xsl:for-each select="/horari/links/link">        
    <xsl:sort select="nom" />
    <p><a href="{url}"><xsl:value-of select="nom"/></a></p>
</xsl:for-each>
```
En aquest exemple s'utilitza per ordenar els elements "nom" resultants d'aquest <xsl:for-each>.

* Element <xsl:if>
S'utilitza per a fer condicions amb el contingut del XML.
```xslt
<xsl:for-each select="catalog/cd">
    <xsl:if test="price &gt; 10">
        <tr>
          <td><xsl:value-of select="title"/></td>
          <td><xsl:value-of select="artist"/></td>
          <td><xsl:value-of select="price"/></td>
        </tr>
    </xsl:if>
</xsl:for-each>
```
En aquest cas s'extreuen només els valors si el preu del cd és major que 10.

* Element <xsl:choose>
L'element <xsl:choose> s'utilitza juntament amb <xsl:when> i <xsl:otherwise> per expressar múltiples condicions.
```xslt
<xsl:choose>
    <xsl:when test=".  &gt; 15" >
      <i class="fa-solid fa-money-bills"></i>
    </xsl:when>
    <xsl:otherwise>
      <i class="fa-solid fa-money-bill"></i>
    </xsl:otherwise>
</xsl:choose>
```
En aquest exemple la imatge canvia si el preu és major que 15 o no.

* Element <xsl:variable>
S'utilitza per declarar variables a xslt.
```xslt
<xsl:variable name="color" select="'red'" />
```
En aquest exemple declarem una variable amb nom "color" i valor "red".

* Element <xsl:apply-templates>
S'utilitza per aplicar plantilles a l'element actual o als fills d'aquest.
```xslt
<p>
  <xsl:apply-templates select="title"/>
  <xsl:apply-templates select="artist"/>
</p>
```
Aquí apliquem les plantilles "title" i "artist".

### Què és XPATH?
XPATH s'utilitza al llenguatge XSLT. S'utilitza per navegar sobre elements i atributs d'un fitxer xml.
Fem servir camins per indicar la situació d'un element de l'arxiu XML.
![Captura de pantalla 2024-04-05 003746](https://github.com/rgonzalezluque/xml-python/assets/165800646/1bcf8518-5813-41d4-bed3-d2fc1692c572)

Exemples de Paths:
/botiga/bluray[1] indica el primer element bluray.
//title[@idioma] indica els títols amb l’atribut idioma.
//title[@idioma=‘cat’] indica els títols amb l’atribut idioma igual a cat.
/botiga/bluray[preu>10] indica tots els bluray amb preu >10.
/botiga/bluray[preu>10]/any indica tots els anys dels bluray amb preu >10.
/botiga/*/preu indica tots els preus dels fills de botiga.
//* indica tots els elements del document.
//titol[@*] indica tots els elements titol amb qualsevol atribut.
//titol | //preu indica tots els titols i preus del document.
/botiga/bluray[2]/titol indica el títol del segon bluray
/botiga/bluray[position()<6]/titol indica el títol de les 5 primeres entrades.
