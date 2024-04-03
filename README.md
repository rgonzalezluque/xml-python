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

Exemple de codi de DOM
`from xml.dom import minidom


doc = minidom.parse("horari.xml")

horari = doc.getElementsByTagName("horari")
alumne = doc.getElementsByTagName("alumne")[0]
dia = doc.getElementsByTagName("dia")

file = open("horari.html", "w",encoding='UTF-8')
file.write("<!DOCTYPE html>")
file.write("<html><head><meta charset='UTF-8' /><title>Horari</title></head><body>\n")

franges = doc.getElementsByTagName("franja")
assig = doc.getElementsByTagName("classes")
nom = alumne.getElementsByTagName("nom")[0].firstChild.data
curs = alumne.getElementsByTagName("curs")[0].firstChild.data
foto = alumne.getElementsByTagName("foto")[0].firstChild.data
colors = doc.getElementsByTagName("colors")[0].getElementsByTagName("assignatura")


file.write(f'''
    <h1>Dades de l'alumne</h1>
    <p>{nom}</p>
    <p>{curs}</p>
    <img src="{foto}"></img>
    ''')
file.write('''
<table>
        <caption>Horari</caption>
           
        <thead>
           <tr><th></th>
''')

diccionariColors = dict()
indexC = 0

for x in colors:
    diccionariColors[x.firstChild.data] = x.getAttribute("color")
    indexC += 1
print(diccionariColors)

indexFranja = 0
for d in dia:
    dia1 = d.getElementsByTagName("nom")[0].firstChild.data
    print(dia1)
    file.write(f"<th>{dia1}</th>")
file.write("\n</thead>")
file.write("\n<tbody>")
file.write("<tr>")

for f in franges:
    franja = f.firstChild.data
    file.write(f"\n<th>{franja}</th>")
    cont = 0
    for i in dia:
        assignatura = i.getElementsByTagName("assignatura")[indexFranja].firstChild.data
        print(assignatura)
        file.write(f"<td style='background-color:{diccionariColors[assignatura]}'>{assignatura}</td>")
    file.write("</tr>")
    indexFranja += 1
file.write("</tbody>")
file.write(("</table>"))`

### Python aplicat a DOM

**Minidom**: mòdul de python per obtindre dades de xml a través de Python

Linea per a importar minidom a *Python*:
`from xml.dom import minidom`

#### Bucle FOR


### XSLT I XPATH
