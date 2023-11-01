file = open("tree.ged", "r", encoding='utf-8')
ancestor = {}

for string in file.readlines():

    if string.find('INDI') != -1:
        ID = string.split(' ')[1].rstrip()
    elif (string.find('GIVN')) != -1:
        name_and_surname = string.split(' ')[2].rstrip()
    elif string.find('SURN') != -1:
        name_and_surname = name_and_surname + ' ' + string.split(' ')[2].rstrip()
    elif string.find('SEX') != -1:
        if string.split(' ')[2].rstrip() == 'F':
            ancestor[ID] = [name_and_surname, '-1', '-1', 'female']
        else:
            ancestor[ID] = [name_and_surname, '-1', '-1', 'male']

    if string.find('HUSB') != -1:
        father = ancestor[string.split(' ')[2].rstrip()][0]
    elif string.find('WIFE') != -1:
        mother = ancestor[string.split(' ')[2].rstrip()][0]
    elif string.find('CHIL') != -1:
        ancestor[string.split(' ')[2].rstrip()][1] = father
        ancestor[string.split(' ')[2].rstrip()][2] = mother

file.close()

outfile = open("tree.pl", "w")

for i in ancestor:
    if ancestor[i][1] != '-1':
        outfile.write("child('" + ancestor[i][0] + "','" + ancestor[i][1] + "').\n")
    if ancestor[i][2] != '-1':
        outfile.write("child('" + ancestor[i][0] + "','" + ancestor[i][2] + "').\n")

for i in ancestor:
    if ancestor[i][3] == 'male':
        outfile.write(ancestor[i][3] + "('" + ancestor[i][0] + "').\n")

for i in ancestor:
    if ancestor[i][3] == 'female':
        outfile.write(ancestor[i][3] + "('" + ancestor[i][0] + "').\n")

outfile.close()