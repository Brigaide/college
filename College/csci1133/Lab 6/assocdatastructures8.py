def makeDictionary(list1, list2):
    list3 = []
    for i in range(0, len(list1)):
        list3 = list3 + [[list1[i], list2[i]]]
    return dict(list3)

def getScore(name, scoreDict):
    try:
        return scoreDict[name]

    except KeyError:
        print ("error name not found")
        return -1

names = ['joe', 'tim', 'barb', 'sue', 'sally']
scores = [10,23,13,18,12]

scoreDict = makeDictionary(names, scores)
