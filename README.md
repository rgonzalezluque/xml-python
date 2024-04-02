# xml-python
Aquest repositori és una recopilació dels meus apunts sobre les tecnològies que hem après a la UF2 de M04 Llenguatge de Marques durant el primer curs d'ASIX al Institut Joaquim Mir.

## *DOM*
### Què és *DOM* (Model d'objectes de document)?
*Dom* és 

### Com recorrer *DOM*?
Propietats:
* Firstchild: Primer hijo
* Lastchild: último hijo
* nodeName: nombre del nodo o elemento
* nodeValue: valor del nodo o elemento
* tagName: nombre de la etiqueta
* getAttribute(): conseguir valor de un atributo
* getElementsbyTagName(): Puedes trabajar con elementos que tienen la misma etiqueta como una lista

Minidom: mòdul de python per obtindre dades de xml a través de Python

Tipus d'objectes: 
* Element
* Attr
* Comment
* Text
* ProcessingInsruction

Linea para importar minidom a Python:
from xml.dom import minidom
