# Homebrew Datafy formulas

Allow you to install the datafy cli using `brew install datamindedbe/datafy-formulas/datafy`.


# Updating formula

To upgrade the formula to point the latest Datafy release, simply run `release.py`. This will:
* Detect the latest version available for download (from https://app.datafy.cloud/api/info/cli/version)
* If the version is greater than the version in the formula, will update the formula
* Will download the installation tar files in memory to compute SHA256 hashes
* Commit the changes to master and push

To test a formula, you can point `brew` directly to a formula source
```
brew install --build-from-source datafy.rb
```

To test the Linux build, you can run `brew` in docker
```
docker run -v `pwd`:/mnt/brew -it homebrew/brew bash
```