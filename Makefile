SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c

REGISTRY_FIELDS := "environment,ClientID,ClientName,IsActive,IsDeprecated,TokenAuthMethod,PublicKeySource,JwksUrl,PublicKey,IdTokenSigningAlgorithm,ClientSecret,PermitMissingNonce,Scopes,IdentityVerificationSupported,ClientLoCs,Claims,LandingPageUrl,JarValidationRequired,PKCEEnforced,MaxAgeEnabled,RateLimit,SectorIdentifierUri,RedirectUrls,PostLogoutRedirectUrls,BackChannelLogoutUri,ClientType,ServiceType,SubjectType,OneLoginService,Contacts"

all: registry 

clean:
	@rm -rf data/processed/*
	@rm -rf data/interim/*


registry: data/processed/registry.csv

data/interim/registry.csv: data/raw/registry.csv
	@qsv enum --new-column environment --constant production $< | qsv select $(REGISTRY_FIELDS)  -o $@

data/processed/registry.csv: data/interim/registry.csv
	@qsv sqlp $< sql/normalise-registry.sql -o $@
	@qsv index $@
