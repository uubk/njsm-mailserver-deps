# NJSM Mailserver deps
Tools and plugins required by the NJSM antispam role.

## Usage
You can either manually install all dependencies and do
```
./build.sh <dist>
```
or you can use the docker-based build:
```
make all
```
After a while, you should end up with a bunch of debian packages in
out-<version>, which you can then publish in some repository.
