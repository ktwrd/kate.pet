#!/usr/bin/env python
import os

beta_conf_location = "/etc/nginx/conf.d/beta.kate.pet.conf"

if not os.path.exists(beta_conf_location):
    print("missing following file, aborting script")
    print("> %s\n" % beta_conf_location)
    exit(0)

print("reading beta config")
print("> %s\n" % beta_conf_location)
beta_conf = open(beta_conf_location, "r")
content = str(beta_conf.read()).replace("beta.kate.pet", "kate.pet")
beta_conf.close()

print("writing repo conf")
print("> ./nginx.conf\n")
git_conf = open("./nginx.conf", "w")
git_conf.write(content)
git_conf.close()

print("updated repo conf to reflect beta config (with replaced strings)")
exit(0)