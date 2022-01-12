# Making Changes

## Cloning the project

```
# Setup test scaffolding
wget -O st_syntax_tests.tar.xz https://download.sublimetext.com/st_syntax_tests_build_4125_x64.tar.xz
tar xf st_syntax_tests.tar.xz
rm st_syntax_tests.tar.xz

mv st_syntax_tests PackagesProject
cd PackagesProject

git clone https://github.com/sourcegraph/Packages.git
mv Packages/.* Data/Packages/
mv Packages/* Data/Packages/
ln -s Data/Packages/TestDockerfile Dockerfile
rmdir Packages
```

## Running tests

On x86_64 Linux, you should be able to directly run `./syntax_tests`.

On a Mac, Docker is needed since the testing binary is only available for x86_64 Linux.
Once Docker is running:

```
docker image build --platform linux/x86_64 --tag st-packages-tests .
docker run --platform linux/x86_64 st-packages-tests
```

If you want to log into the container and manually run the tests

```
docker run --platform linux/x86_64 --interactive --tty st-packages-tests /bin/sh
```
