build :
	docker build --no-cache -t flan_scan -f Dockerfile .

container_name = flan_$(shell date +'%s')
start :
	docker run --rm --network=host --name $(container_name) -v "$(CURDIR)/shared:/shared:Z" flan_scan

md :
	docker run --rm --network=host --name $(container_name) -v "$(CURDIR)/shared:/shared:Z" -e format=md flan_scan

html :
	docker run --rm --network=host --name $(container_name) -v "$(CURDIR)/shared:/shared:Z" -e format=html flan_scan

json :
	docker run --rm --network=host --name $(container_name) -v "$(CURDIR)/shared:/shared:Z" -e format=json flan_scan
