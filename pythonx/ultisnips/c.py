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

