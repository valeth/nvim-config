def returnval(rtype, fname):
    if rtype == "void":
        return ""

    if fname == "main":
        return "EXIT_SUCCESS"

    ret = {
        "int": "0",
        "float": "0.0",
        "double": "0.0",
        "bool": "false"
    }

    if rtype in ret.keys():
        return ret[rtype]
    else:
        return "NULL"

def getNoteCandidates(t):
    options = ["TODO", "FIXME", "XXX"]
    if t:
        options = [ x[len(t):] for x in options if x.startswith(t) ]	

    if len(options) == 1:
        return options[0]

    return "[" + ",".join(options) + "]"

