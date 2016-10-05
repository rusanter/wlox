# Application Definition
APPNAME=wlox
VERSION=$(shell git describe --tags)

# GCP Config
GCP_PROJECT=gfts-coinapult
NAMESPACE=gcr.io/$(GCP_PROJECT)
LOCATION=us-central1-a
CLUSTER=wlox-dev

# Docker Config
FRONTEND_PORT=5900:80
ADMIN_PORT=5901:80

build:  
	cd api && docker build -t $(NAMESPACE)/$(APPNAME)-api -t $(NAMESPACE)/$(APPNAME)-api:$(VERSION) .
	cd auth && docker build -t $(NAMESPACE)/$(APPNAME)-auth -t $(NAMESPACE)/$(APPNAME)-auth:$(VERSION) .
	cd backstage2 && docker build -t $(NAMESPACE)/$(APPNAME)-backstage2 -t $(NAMESPACE)/$(APPNAME)-backstage2:$(VERSION) .
	cd cron && docker build -t $(NAMESPACE)/$(APPNAME)-cron -t $(NAMESPACE)/$(APPNAME)-cron:$(VERSION) .
	cd cryptocap && docker build -t $(NAMESPACE)/$(APPNAME)-cryptocap -t $(NAMESPACE)/$(APPNAME)-cryptocap:$(VERSION) .
	cd frontend && docker build -t $(NAMESPACE)/$(APPNAME)-frontend -t $(NAMESPACE)/$(APPNAME)-frontend:$(VERSION) .

rundev: build
	sed 's~{{IMAGE}}~$(NAMESPACE)/$(APPNAME)~g; s~{{VERSION}}~$(VERSION)~g; s~{{FRONTEND_PORT}}~$(FRONTEND_PORT)~g; s~{{ADMIN_PORT}}~$(ADMIN_PORT)~g' docker-compose.tmpl.yml > docker-compose.yml
	docker-compose up
	docker-compose down --rmi all -v --remove-orphans

push:	build
	gcloud config set project $(GCP_PROJECT)
	gcloud docker push $(NAMESPACE)/$(APPNAME)-api:$(VERSION)
	gcloud docker push $(NAMESPACE)/$(APPNAME)-auth:$(VERSION)
	gcloud docker push $(NAMESPACE)/$(APPNAME)-backstage2:$(VERSION)
	gcloud docker push $(NAMESPACE)/$(APPNAME)-cron:$(VERSION)
	gcloud docker push $(NAMESPACE)/$(APPNAME)-cryptocap:$(VERSION)
	gcloud docker push $(NAMESPACE)/$(APPNAME)-frontend:$(VERSION)

deploy: push
	gcloud container clusters get-credentials $(CLUSTER) --zone=$(LOCATION)
	sed 's~{{IMAGE}}~$(NAMESPACE)/$(APPNAME)~g; s~{{VERSION}}~$(VERSION)~g; s~{{CLUSTER}}~$(CLUSTER)~g' gcp.tmpl.yml > gcp.yml
	kubectl apply -f gcp.yml
