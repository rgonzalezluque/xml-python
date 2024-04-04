from xml.dom import minidom


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

for x in colors:
    diccionariColors[x.firstChild.data] = x.getAttribute("color")
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
file.write(("</table>"))