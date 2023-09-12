-	Install Python 3.9
	
	yum install gcc openssl-devel bzip2-devel libffi-devel -y
	-	To download the latest version of python
	curl -O https://www.python.org/ftp/python/3.9.13/Python-3.9.13.tgz
	-	extract the package
	tar -xzf Python-3.9.13.tgz
	-	go into the directory
	cd Python-3.9.13/
	-	prepare a make file for us to install python 3.9.13
	./configure --enable-optimizations
	make altinstall
	python3.9

-	Install Devtoolset

	yum install centos-release-scl
	yum install devtoolset-7-gcc*
	scl enable devtoolset-7 bash
	i 	this will enable gcc 7

-	Creating Virtual Environment

	python -m venv <virtual-environment-name>
	source <virtual-environment-name>/bin/activate
	deactivate
