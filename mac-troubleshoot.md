## Some important tips on Mac related issues

### 1- pip and pip3 pointing to same python
solution 1: https://medium.com/@noootown/dealing-with-python3-python2-pip-pip3-andvirtualenv-installation-on-os-x-d87e687eb545
solution 2:
in profile.sh, add
```
alias pip='python -m pip'
alias pip3='python3 -m pip'
```
