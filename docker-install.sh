
       echo "[1] initialisation du référentiel apt de Docker"
	   
		sudo apt-get update
		sudo apt-get install -y ca-certificates curl gnupg
		sudo install -m 0755 -d /etc/apt/keyrings
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
		sudo chmod a+r /etc/apt/keyrings/docker.gpg
		echo \
		"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
		$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
		sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
		
		echo "[2] mise a jour des paquette apt"	
		sudo apt-get update
	
        echo "[3] installation de Docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"	
			
		sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
		
	 
		echo "[4] installation de docker compose"
		
         sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	     sudo chmod +x /usr/local/bin/docker-compose
	   
	   #
	    echo "[5] installation de l'autocompletion pour les cmds docker et docker compose"
	     sudo curl -L https://raw.githubusercontent.com/docker/compose/1.26.0/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
		
	    echo "[6] activation et lancement du service Docker"
		sudo systemctl enable docker
		sudo systemctl start docker
		
		echo"[7] creation et lancement des micro-services Wordpress et mysql"
		sudo docker-compose up -d
       echo "[8] ==================================== fin du deploiement des micro-services ==================================="	    