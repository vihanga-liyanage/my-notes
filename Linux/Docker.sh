
# Install docker
# =============================================================================================================
	# Add the GPG key for the official Docker repository to the system:
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	# Add the Docker repository to APT sources:
		sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	# Update the package database with the Docker packages from the newly added repo:
		sudo apt-get update
	# Make sure you are about to install from the Docker repo instead of the default Ubuntu 16.04 repo:
		apt-cache policy docker-ce
	# You should see output similar to the follow:
		# Output of apt-cache policy docker-ce
		# docker-ce:
		# Installed: (none)
		# Candidate: 17.03.1~ce-0~ubuntu-xenial
		# Version table:
		# 17.03.1~ce-0~ubuntu-xenial 500
		# 500 https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages
		# 17.03.0~ce-0~ubuntu-xenial 500
		# 500 https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages

	# Notice that docker-ce is not installed, but the candidate for installation is from the Docker repository for Ubuntu 16.04. 
	# The docker-ce version number might be different.

	# Finally, install Docker:
		sudo apt-get install -y docker-ce
	# Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that it's running:
		sudo systemctl status docker

# Executing the Docker Command Without Sudo
# =============================================================================================================
	# Add your username to the docker group:
		sudo usermod -aG docker ${USER}
	# To apply the new group membership, you can log out of the server and back in, or you can type the following:
		su - ${USER}
	# Bellow command should run without errors
		docker ps
		
# Install docker-compose
# =============================================================================================================
	sudo touch /usr/local/bin/docker-compose
	sudo chmod 777 /usr/local/bin/docker-compose
	curl -L https://github.com/docker/compose/releases/download/1.8.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

# Usefull docker commands
# =============================================================================================================
	# Get IPs of all running containers
		docker inspect -f '{{.Name}} - {{ .NetworkSettings.Networks.pattern2_default.IPAddress }}' $(docker ps -q)

	# Stop all running containers
		docker stop $(docker ps -q)

	# Remove all containers
		docker rm $(docker ps -aq)

	# Run simple commands in a vm
		docker-machine ssh swarm-master ls -l <machine name>

	# Copy a file from vm to vm using docker
		docker-machine scp ../docker-apim/docker-compose/pattern-2/pattern2.dab swarm-master:
		# docker-machine scp <local file path> <machine name>:<path inside the machine>

	# Or you can simply go into the vm by,
		docker-machine ssh <machine name>

	# Run docker local register as a container
		docker run -d -p 5000:5000 --restart=always --name registry registry:2
		# Now can push to this registry by tagging the images as localhost:5000/<name>

	# Filter docker machines by state=stopped and format to get only the machine names
		docker-machine ls --filter state=Stopped --format "{{.Name}}"

	# Make the local machine a mnager node in a swarm
		docker swarm init --advertise-addr 127.0.0.1
		# Can deploy .dab from this point

	# Leave the swarm
		docker swarm leave --force

	# Remove containers by regex -> "^<none>" -> name starts with <none>
		docker rmi $(docker images | grep "^<none>" | awk "{print $3}")

	# Log into a docker container through bash
		docker exec -it <container id> bash

# Tutorial : Create a sample cluster in your local machine
# =============================================================================================================

	# Create a vm as local
		docker-machine create -d virtualbox local

	# Go into that vm
		eval $(docker-machine env local)

	# create a new swarm from local - will return a token - in this case 7b42679a84d35f9285b7d9089605ab4e
		docker run swarm create

	# Create the swar master vm
		docker-machine create -d virtualbox --swarm --swarm-master --swarm-discovery token://7b42679a84d35f9285b7d9089605ab4e swarm-master
	# Create three nodes - first one have a flag as frontend
		docker-machine create -d virtualbox --swarm --engine-label itype=frontend --swarm-discovery token://7b42679a84d35f9285b7d9089605ab4e swarm-node-01
		docker-machine create -d virtualbox --swarm --swarm-discovery token://7b42679a84d35f9285b7d9089605ab4e swarm-node-02
		docker-machine create -d virtualbox --swarm --swarm-discovery token://7b42679a84d35f9285b7d9089605ab4e swarm-node-03

	# Go into swarm master
		eval $(docker-machine env --swarm swarm-master)

	# check swarm cluster info
		docker info

	# make sure no containers running
		docker ps
	# run ubuntu image in the cluster - may take time
		docker run -itd --name engmgr ubuntu
	# check if it's running
		docker ps

	# run 6 ubuntu images in the cluster
		for i in `seq 1 6`; do docker run -itd -e constraint:itype!=frontend --name eng$i ubuntu; done

# Re-run docker pattern by cleaning previous containers
# =============================================================================================================
	docker stop $(docker ps -aq)
	docker rm $(docker ps -aq)
	docker run -d -p 5000:5000 --restart=always --name registry registry:2
	docker-compose up --build

# Install Oracel DB instance
# =============================================================================================================
	sudo docker pull sath89/oracle-12c
	CID=$(sudo docker create sath89/oracle-12c)
	sudo docker start $CID
	sudo docker logs -f $CID
	sudo docker exec -it $CID sqlplus sys as sysdba
		# password -> oracle
