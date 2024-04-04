from xml.dom import minidom

doc = minidom.parse("universitat.xml")

estudiants = doc.getElementsByTagName("persona")

personas = dict()

for x in estudiants:
    nom = x.getElementsByTagName("nom")[0].firstChild.data
    cognom = x.getElementsByTagName("cognoms")[0].firstChild.data
    assignatures = x.getElementsByTagName("assignatura")
    assg = list()
    for subj in assignatures:
        assignatura = subj.firstChild.data
        assg.append(assignatura)
    personas[nom+" "+cognom] = assg


continuar = True

menu = '''
1. Buscar persona
2. Sortir'''

while continuar:
    print(menu)
    opcio = int(input("Escull l'opció: "))
    if opcio == 1:
        print("Aquestes són les persones disponibles: ")
        for k in personas:
            print(f"- {k}")
        persona = input("Indica la persona a buscar: ")
        if persona in personas:
            print(f"Aquestes són les assignatures que cursa {persona}: ")
            for x in personas[persona]:
                print(f"- {x}")
        else:
            print("Aquesta persona no existeix!! ")
    elif opcio == 2:
        continuar = False
        print("Has sortir del programa!!")
    else:
        print("Opció no correcta!! ")