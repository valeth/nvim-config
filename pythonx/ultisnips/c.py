def returnval(t):
    if t == "void":
        return ""

    ret = {
        "int": "0",
        "float": "0.0",
        "double": "0.0",
        "bool": "false"
    }

    if t in ret.keys():
        return "return " + ret[t] + ";"
    else:
        return "return NULL;"

def getNoteCandidates(t):
    options = ["TODO", "FIXME", "XXX"]
    if t:
        options = [ x[len(t):] for x in options if x.startswith(t) ]	

    if len(options) == 1:
        return options[0]
    
    return "[" + ",".join(options) + "]"

