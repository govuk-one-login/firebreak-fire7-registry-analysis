SELECT 
environment, 
ClientID,
LENGTH(ClientID) as clientid_length,
ClientName,
LENGTH(ClientName) as clientname_length,
CASE
    WHEN IsActive IS NULL THEN 'true'
    WHEN IsActive =  '' THEN 'true'
    WHEN IsActive =  'true' THEN 'true'
    WHEN IsActive =  'false' THEN 'false'
    ELSE 'error'
END  IsActive,
CASE
    WHEN IsDeprecated IS NULL THEN 'false'
    WHEN IsDeprecated =  '' THEN 'false'
    WHEN IsDeprecated =  'true' THEN 'true'
    WHEN IsDeprecated =  'false' THEN 'false'
    ELSE 'error'
END  IsDeprecated,

CASE
    WHEN TokenAuthMethod IS NULL THEN 'private_key_jwt'
    WHEN TokenAuthMethod =  '' THEN 'private_key_jwt'
    WHEN TokenAuthMethod = 'private_key_jwt'  THEN 'private_key_jwt'
    WHEN TokenAuthMethod = 'client_secret_post'  THEN 'client_secret_post'
    ELSE 'error'
END  TokenAuthMethod,
CASE
    WHEN PublicKeySource IS NULL THEN 'STATIC'
    WHEN PublicKeySource = '' THEN 'STATIC'
    WHEN PublicKeySource = 'JWKS' THEN 'JWKS'
    WHEN PublicKeySource = 'STATIC' THEN 'STATIC'
    ELSE 'error'
END  PublicKeySource,
LENGTH(PublicKey) as publickey_length,
JwksUrl,
CASE
    WHEN JwksUrl IS NULL THEN 'false'
    WHEN JwksUrl IS NOT NULL THEN 'true'
END has_jwks_url,
PublicKey,
CASE
    WHEN PublicKey IS NULL THEN 'false'
    WHEN PublicKey IS NOT NULL THEN 'false'
END has_publickey,
CASE
    WHEN IdTokenSigningAlgorithm IS NULL THEN 'ES256'
    WHEN IdTokenSigningAlgorithm = '' THEN 'ES256'
    WHEN IdTokenSigningAlgorithm = 'RS256' THEN 'RS256'
    WHEN IdTokenSigningAlgorithm = 'ES256' THEN 'ES256'
    WHEN IdTokenSigningAlgorithm = 'RSA256' THEN 'RS256'
    ELSE 'error'
END IdTokenSigningAlgorithm,
ClientSecret,
LENGTH(ClientSecret) as client_secret_length,
CASE
    WHEN ClientSecret IS NULL THEN 'false'
    WHEN ClientSecret IS NOT NULL THEN 'true'
END has_clientsecret,
CASE
    WHEN PermitMissingNonce IS NULL THEN 'false'
    WHEN PermitMissingNonce = '' THEN 'false'
    WHEN PermitMissingNonce = 'true' THEN 'true'
    WHEN PermitMissingNonce = 'false' THEN 'false'
    ELSE 'error'
END PermitMissingNonce,
Scopes,
CASE
    WHEN Scopes IS NULL THEN 'false'
    WHEN Scopes IS NOT NULL THEN 'true'
    ELSE 'error'
END has_scopes,
CASE
    WHEN IdentityVerificationSupported IS NULL THEN 'false'
    WHEN IdentityVerificationSupported = '' THEN 'false'
    WHEN IdentityVerificationSupported = 'true' THEN 'true'
    WHEN IdentityVerificationSupported = '1' THEN 'true'
    WHEN IdentityVerificationSupported = '0' THEN 'false'
    WHEN IdentityVerificationSupported = 'false' THEN 'false'
    ELSE 'error'
END IdentityVerificationSupported,
ClientLoCs,
Claims,
CASE
    WHEN Claims IS NULL THEN 'false'
    WHEN Claims = '[]'  THEN 'false'
    WHEN Claims IS NOT NULL THEN 'true'
    ELSE 'error'
END has_claims,
LandingPageUrl,
CASE
    WHEN LandingPageUrl IS NULL THEN 'false'
    WHEN LandingPageUrl IS NOT NULL THEN 'true'
END has_landingpageurl,
CASE
    WHEN JarValidationRequired IS NULL THEN 'false'
    WHEN JarValidationRequired = '' THEN 'false'
    WHEN JarValidationRequired = 'true' THEN 'true'
    WHEN JarValidationRequired = '1' THEN 'true'
    WHEN JarValidationRequired = '0' THEN 'false'
    WHEN JarValidationRequired = 'false' THEN 'false'
    ELSE 'error'
END JarValidationRequired,
CASE
    WHEN PKCEEnforced IS NULL THEN 'false'
    WHEN PKCEEnforced = '' THEN 'false'
    WHEN PKCEEnforced = 'true' THEN 'true'
    WHEN PKCEEnforced = '1' THEN 'true'
    WHEN PKCEEnforced = '0' THEN 'false'
    WHEN PKCEEnforced = 'false' THEN 'false'
    ELSE 'error'
END PKCEEnforced,
CASE
    WHEN MaxAgeEnabled IS NULL THEN 'false'
    WHEN MaxAgeEnabled = '' THEN 'false'
    WHEN MaxAgeEnabled = 'true' THEN 'true'
    WHEN MaxAgeEnabled = '1' THEN 'true'
    WHEN MaxAgeEnabled = '0' THEN 'false'
    WHEN MaxAgeEnabled = 'false' THEN 'false'
    ELSE 'error'
END MaxAgeEnabled,
RateLimit,
CASE
    WHEN RateLimit IS NULL THEN 'false'
    WHEN RateLimit IS NOT NULL THEN 'true'
END has_ratelimit,
SectorIdentifierUri,
CASE
    WHEN SectorIdentifierUri IS NULL THEN 'false'
    WHEN SectorIdentifierUri IS NOT NULL THEN 'true'
END has_sectoridentifieruri,
RedirectUrls,
CASE
    WHEN RedirectUrls IS NULL THEN 'false'
    WHEN RedirectUrls IS NOT NULL THEN 'true'
END has_redirecturls,
CASE
    WHEN PostLogoutRedirectUrls IS NULL THEN '[]'
    ELSE PostLogoutRedirectUrls
END PostLogoutRedirectUrls,
CASE
    WHEN PostLogoutRedirectUrls IS NULL THEN 'false'
    WHEN PostLogoutRedirectUrls IS NOT NULL THEN 'true'
END has_postlogoutredirecturls,
BackChannelLogoutUri,
CASE
    WHEN BackChannelLogoutUri IS NULL THEN 'false'
    WHEN BackChannelLogoutUri IS NOT NULL THEN 'true'
END has_backchannellogouturi,
CASE
    WHEN ClientType IS NULL THEN 'web'
    WHEN ClientType = '' THEN 'web'
    WHEN ClientType = 'web' THEN 'web'
    WHEN ClientType = 'app' THEN 'app'
    ELSE 'error'
END ClientType,
CASE
    WHEN ServiceType = 'MANDATORY' THEN 'MANDATORY'
    WHEN ServiceType = 'mandatory' THEN 'MANDATORY'
    WHEN ServiceType = 'OPTIONAL' THEN 'OPTIONAL'
    ELSE 'error'
END ServiceType,
SubjectType,
CASE 
    WHEN OneLoginService IS NULL THEN 'false'
    WHEN OneLoginService = 'true' THEN 'true'
    WHEN OneLoginService = 'false' THEN 'false'
    ELSE 'error'
END OneLoginService,
CASE
    WHEN Contacts IS NULL THEN '[]'
    ELSE Contacts
END Contacts
FROM registry; 
