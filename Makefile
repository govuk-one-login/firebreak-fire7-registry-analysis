SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c

EPIC_FIELDS := "issue_key,summary,custom_field__production_client_id_,status,assignee,custom_field__technical_architect_,custom_field__dept_abbreviation_,custom_field__added_to_roadmap_,due_date,custom_field__estimated_service_go_live_date_,custom_field__products_used_,custom_field__rp_category_,custom_field__no__of_services_,custom_field__rag_status_"

EPIC_FIELDS_RENAMED := "issue_key,epic,assignee,engagement_manager,custom_field__production_client_id_,client_id,custom_field__technical_architect_,technical_architect,custom_field__dept_abbreviation_,dept_abbrev,custom_field__added_to_roadmap_,roadmap,custom_field__estimated_service_go_live_date_,estimated_live_date,custom_field__products_used_,products,custom_field__rp_category_,category,custom_field__no__of_services_,service_count,custom_field__rag_status_,rag_status"

REGISTRY_FIELDS := "environment,ClientID,ClientName,IsActive,IsDeprecated,TokenAuthMethod,PublicKeySource,JwksUrl,PublicKey,IdTokenSigningAlgorithm,ClientSecret,PermitMissingNonce,Scopes,IdentityVerificationSupported,ClientLoCs,Claims,LandingPageUrl,JarValidationRequired,PKCEEnforced,MaxAgeEnabled,RateLimit,SectorIdentifierUri,RedirectUrls,PostLogoutRedirectUrls,BackChannelLogoutUri,ClientType,ServiceType,SubjectType,OneLoginService,Contacts"

all: registry epics 

clean:
	@rm -rf data/processed/*
	@rm -rf data/interim/*

epics: data/processed/epics.csv

registry: data/processed/registry.csv

data/interim/registry.csv: data/raw/registry.csv
	@qsv enum --new-column environment --constant production $< | qsv select $(REGISTRY_FIELDS)  -o $@

data/processed/registry.csv: data/interim/registry.csv
	@qsv sqlp $< sql/normalise-registry.sql -o $@
	@qsv index $@

data/interim/epics.csv: data/raw/epics.csv
	@qsv safenames $< | qsv select $(EPIC_FIELDS) | qsv rename --pairwise issue_key,epic,assignee,engagement_manager,custom_field__production_client_id_,client_id,custom_field__technical_architect_,technical_architect,custom_field__dept_abbreviation_,dept_abbrev,custom_field__added_to_roadmap_,roadmap,custom_field__estimated_service_go_live_date_,estimated_live_date,custom_field__products_used_,products,custom_field__rp_category_,category,custom_field__no__of_services_,service_count,custom_field__rag_status_,rag_status -o $@

data/processed/epics.csv: data/interim/epics.csv
	@qsv sqlp $< sql/normalise-epics.sql -o $@
	@qsv index $@
