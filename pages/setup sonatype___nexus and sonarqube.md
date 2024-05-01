### docker image sonarquebe
	- docker run -d -p 9000:9000 sonarqube: lts-community
- ### docker image run sonatype/nexus
	- docker run -d -p 8081:8081 sonatype/nexus3
	- docker exec -it /bin/bash
	- docker exec -it <CONTAINER ID> /bin/bash
	- cd sonatype-work/
	- cd nexus3/
	- cat admin.password