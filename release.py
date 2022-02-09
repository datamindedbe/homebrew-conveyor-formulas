#!/usr/bin/env python
import os, re, subprocess, hashlib, sys
from pathlib import Path
import urllib.request as ur

# If the --noninteractive flag is set, the script will not prompt for user input
noninteractive = "--noninteractive" in sys.argv
# If the --noninteractive flag is set, the script pushes the resulting formula to the repo iff the --push flag is also set
noninteractive_push = "--push" in sys.argv

datafy_cmd="datafy"
latest_version_url="https://app.datafy.cloud/api/info/cli/version"
version_to_release_urls = lambda version: {
    "macos_intel": f"https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/{version}/datafy_darwin_amd64.tar.gz",
    "macos_arm": f"https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/{version}/datafy_darwin_arm64.tar.gz",
    "linux_intel": f"https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/{version}/datafy_linux_amd64.tar.gz",
}
formula_path = Path(os.path.realpath(__file__)).parent.joinpath("Formula", "datafy.rb")
template_path = Path(os.path.realpath(__file__)).parent.joinpath("Formula", "datafy.template")
released_version=re.search("version\s+\"([\d\.]+)", formula_path.read_text())[1]
latest_version=ur.urlopen(latest_version_url).read().decode('utf-8')

print(f"Released version: {released_version}")
print(f"Latest version: {latest_version}")
# if latest_version == released_version:
#     print("Good news! Latest version already released; exiting")
#     exit()

release_urls = version_to_release_urls(latest_version)
print(f"Downloading releases from {release_urls}")
shas = {platform: hashlib.sha256(ur.urlopen(url).read()).hexdigest() for platform, url in release_urls.items()}
print(f"Release hashes: {shas}")

if not noninteractive:
    if input("upgrade formula definition? y/N   ") != "y":
        print("Exiting")
        exit()

with open(template_path, 'r') as template:
  new_formula = template.read().replace('<version>', latest_version)
  for platform in release_urls.keys():
    new_formula = new_formula.replace(f'<{platform}_sha256>', shas[platform])
  formula_path.write_text(new_formula)
print("Updated forumula")

if not noninteractive_push:
    if noninteractive or input("commit to repo and push? y/N   ") != "y":
        print("Exiting")
        exit()

print("Committing new version to repo and pushing")
subprocess.run(f"git add . && git commit -m 'upgrade to v{latest_version}' && git push", shell=True)
