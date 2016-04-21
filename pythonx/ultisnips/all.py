def getUsername(username, gecos = True, passwd = "/etc/passwd"):
    content = [x.split(":") for x in open(passwd, "r").readlines()]

    for entry in content:
        if len(entry) != 0 and entry[0] == username:
            if gecos and len(entry[4]) != 0:
                return entry[4]
            else:
                return username

