# xml-python
Aquest repositori és una recopilació dels meus apunts sobre les tecnològies que hem après a la UF2 de M04 Llenguatge de Marques durant el primer curs d'ASIX al Institut Joaquim Mir.

## *DOM*
### Què és *DOM* (Model d'objectes de document)?
*Dom* és una representació estructurada d'un document HTML/XML que el navegador pot interpretar i manipular. El DOM és essencial per a la creació de pàgines web interactives i dinàmiques.

Més informació a: https://developer.mozilla.org/es/docs/Web/API/Document_Object_Model/Introduction
### Com recórrer *DOM*?
**Propietats**:
* Firstchild: Primer fill
* Lastchild: últim fill
* nodeName: nom del node o element
* nodeValue: valor del node o element
* tagName: nom de l'etiqueta
* getAttribute(): conseguir valor de un atribut
* getElementsbyTagName(): Pots trabajar con element que tenen la mateixa etiqueta com una llista

Tipus d'**objectes**: 
* Element
* Attr
* Comment
* Text
* ProcessingInsruction

Exemple de codi amb DOM


### Python aplicat a DOM

**Minidom**: mòdul de python per obtindre dades de xml a través de Python

Linea per a importar minidom a *Python*:
`from xml.dom import minidom`

#### Bucle FOR
Explicación FOR

Exemple de bucle for 
![Captura de pantalla 2024-04-03 172519](https://github.com/rgonzalezluque/xml-python/assets/165800646/6a2e4744-949f-4cef-97a5-9d1ad1b3dea8)

### XSLT I XPATH
#### Què és XSLT?
**XSLT** (eXtensible Stylesheet Language Transformations) és un llenguatge per transformar documents XML en altres documents XML o en altres tipus de documents com 
ara HTML, text pla o en format XSL-FO (que després pot ser convertit a PDF, PostScript i/o PNG).
