CMD=gitbook
FLAGS=--log=debug --debug

API_URL_DEBUG=http://localhost:3000
BLOCKCHAIN_PROVIDER_PRODUCTION=https://ropsten.infura.io
BLOCKCHAIN_PROVIDER_DEBUG=http://localhost:7545

ifndef PRIVATE_KEY
$(error PRIVATE_KEY is not set)
endif

build:
	@BLOCKCHAIN_PROVIDER=$(BLOCKCHAIN_PROVIDER_PRODUCTION) PRIVATE_KEY=$(PRIVATE_KEY) $(CMD) build ./

debug:
	API_URL=$(API_URL_DEBUG) BLOCKCHAIN_PROVIDER=$(BLOCKCHAIN_PROVIDER_DEBUG) PRIVATE_KEY=$(PRIVATE_KEY) $(CMD) serve $(FLAGS)

write:
	API_URL=$(API_URL_DEBUG) BLOCKCHAIN_PROVIDER=$(BLOCKCHAIN_PROVIDER_DEBUG) WRITE_MODE=true $(CMD) serve $(FLAGS)

all: build

clean:
	rm -fr _book
