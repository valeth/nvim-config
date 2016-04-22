import subprocess
import re
import hashlib
import binascii

def getUsername(username, gecos = True, passwd = "/etc/passwd"):
    content = [x.split(":") for x in open(passwd, "r").readlines()]

    for entry in content:
        if len(entry) != 0 and entry[0] == username:
            if gecos and len(entry[4]) != 0:
                return entry[4]
            else:
                return username

def getWPAPassphraseHash(ssid, passphrase):
    if len(passphrase) >= 8:
        proc = subprocess.Popen(["wpa_passphrase", ssid, passphrase], stdout=subprocess.PIPE)
        proc.wait()
        for line in proc.stdout.readlines():
            match = re.match("^\s*psk.*$", line.decode("utf-8"))
            if match:
                return match.string.split("=")[1].strip()
    return ""

def getEAPPassphraseHash(passphrase):
    hash = hashlib.new("md4", passphrase.encode("utf-16le")).digest()
    return binascii.hexlify(hash).decode("utf-8")

if __name__ == "__main__":
    print(getWPAPassphraseHash("MySSID", "MySecurePassword"))

