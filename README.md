# xml-python
Aquest repositori és una recopilació dels meus apunts sobre les tecnològies que hem après a la UF2 de M04 Llenguatge de Marques durant el primer curs d'ASIX al Institut Joaquim Mir.

## *DOM*
### Què és *DOM* (Model d'objectes de document)?
*Dom* és una representació estructurada d'un document HTML/XML que el navegador pot interpretar i manipular. El DOM és essencial per a la creació de pàgines web interactives i dinàmiques.

Més informació a: https://developer.mozilla.org/es/docs/Web/API/Document_Object_Model/Introduction
### Com recórrer *DOM*?
**Propietats**:
* Firstchild: primer fill
* Lastchild: últim fill
* nodeName: nom del node o element
* nodeValue: valor del node o element
* tagName: nom de l'etiqueta
* getAttribute(): conseguir valor de un atribut
* getElementsbyTagName(): pots trabajar con element que tenen la mateixa etiqueta com una llista

Tipus d'**objectes**: 
* Element
* Attr
* Comment
* Text
* ProcessingInsruction

Exemple de codi amb DOM
```python
exemple
```
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
colors = doc.getElementsByTagName("colors")[0].getElementsByTagName("assignatura")
for x in colors:
    diccionariColors[x.firstChild.data] = x.getAttribute("color")
    indexC += 1
print(diccionariColors)
```
En aquest exemple utilitzem un bucle for per obtindre el atribut del color de cada assignatura.

## XSLT I XPATH
### Què és XSLT?
**XSLT** (eXtensible Stylesheet Language Transformations) és un llenguatge per transformar documents XML en altres documents XML o en altres tipus de documents com 
ara HTML, text pla o en format XSL-FO (que després pot ser convertit a PDF, PostScript i/o PNG).

![image](https://github.com/rgonzalezluque/xml-python/assets/165800646/e441bc0a-42b2-4161-b8c3-1930d3c4263b)
