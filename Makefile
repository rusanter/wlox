# Application Definition
APPNAME=wlox
VERSION=1.15.0-rc3

# GCP Config
GCP_PROJECT=gfts-coinapult-wlox
NAMESPACE=gcr.io/$(GCP_PROJECT)

build:  build_api build_auth build_admin build_cron build_frontend

build_api:
	cd api && docker build -t $(NAMESPACE)/$(APPNAME)-api -t $(NAMESPACE)/$(APPNAME)-api:$(VERSION) .

build_auth:
	cd auth && docker build -t $(NAMESPACE)/$(APPNAME)-api -t $(NAMESPACE)/$(APPNAME)-api:$(VERSION) .

build_admin:
	cd backstage2 && docker build -t $(NAMESPACE)/$(APPNAME)-api -t $(NAMESPACE)/$(APPNAME)-api:$(VERSION) .

build_cron:
	cd cron && docker build -t $(NAMESPACE)/$(APPNAME)-api -t $(NAMESPACE)/$(APPNAME)-api:$(VERSION) .

build_frontend:
	cd frontend && docker build -t $(NAMESPACE)/$(APPNAME)-frontend -t $(NAMESPACE)/$(APPNAME)-frontend:$(VERSION) .

rundev: 
	docker-compose up --build

push:	push_api push_auth push_admin push_cron push_frontend

push_api: build_api
	gcloud config set project $(GCP_PROJECT)
	gcloud docker push $(NAMESPACE)/$(APPNAME)-api:$(VERSION)

push_auth: build_auth
	gcloud config set project $(GCP_PROJECT)
	gcloud docker push $(NAMESPACE)/$(APPNAME)-auth:$(VERSION)

push_admin: build_admin
	gcloud config set project $(GCP_PROJECT)
	gcloud docker push $(NAMESPACE)/$(APPNAME)-admin:$(VERSION)

push_cron: build_cron
	gcloud config set project $(GCP_PROJECT)
	gcloud docker push $(NAMESPACE)/$(APPNAME)-cron:$(VERSION)

push_frontend: build_frontend
	gcloud config set project $(GCP_PROJECT)
	gcloud docker push $(NAMESPACE)/$(APPNAME)-frontend:$(VERSION)

