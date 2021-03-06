.PHONY: all test clean

all: reload build run

reload: halt up provision

halt:
	vagrant halt

up:
	vagrant up

provision:
	vagrant provision

build:
	@echo "======= BUILDING KOHA-PATCHED CONTAINER ======\n"
	vagrant ssh -c 'sudo docker build -t digibib/koha-patched /vagrant/koha-patched'

stop: 
	@echo "======= STOPPING KOHA-PATCHED CONTAINER ======\n"
	vagrant ssh -c 'sudo docker stop koha_patched_docker' || true

delete: stop
	@echo "======= DELETING KOHA-PATCHED CONTAINER ======\n"
	vagrant ssh -c 'sudo docker rm koha_patched_docker' || true

ENVFLAGS=
ifdef KOHABUGS
ENVFLAGS += -e KOHABUGS="$(KOHABUGS)"
endif
ifdef TEST_QA
ENVFLAGS += -e TEST_QA=$(TEST_QA)
endif
ifdef SKIP_BUILD
ENVFLAGS += -e SKIP_BUILD=$(SKIP_BUILD)
endif

run: delete			## start koha_patched_docker - args: KOHABUGS, TEST_QA
	@echo "======= RUNNING KOHA-PATCHED CONTAINER ======\n"
	vagrant ssh -c 'sudo docker run --name koha_patched_docker \
	-v "/vagrant/koha-patched/debian:/debian" \
	-v "/vagrant/koha-patched/patches:/patches" \
	$(ENVFLAGS) \
	-t digibib/koha-patched' || echo "koha_patched_docker container already running, please 'make delete' first"

logs-f:
	vagrant ssh -c 'sudo docker logs -f koha_patched_docker'

clean:
	vagrant destroy --force

login: # needs EMAIL, PASSWORD, USERNAME
	@ vagrant ssh -c 'sudo docker login --email=$(EMAIL) --username=$(USERNAME) --password=$(PASSWORD)'

tag = "$(shell git rev-parse HEAD)"
push:
	@echo "======= PUSHING KOHA-PATCHED CONTAINER ======\n"
	vagrant ssh -c 'sudo docker tag digibib/koha-patched digibib/koha-patched:$(tag)'
	vagrant ssh -c 'sudo docker push digibib/koha-patched'

