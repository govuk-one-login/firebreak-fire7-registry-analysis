SELECT
epic,
CASE
    WHEN epic IS NULL THEN ''
    ELSE 'https://govukverify.atlassian.net/browse/'|| epic
END AS epic_url,
summary,
client_id,
CASE
    WHEN client_id IS NULL THEN ''
    ELSE 'https://eu-west-2.console.aws.amazon.com/dynamodbv2/home?region=eu-west-2#edit-item?itemMode=2&pk='|| client_id || '&route=ROUTE_ITEM_EXPLORER&table=production-client-registry'
END AS client_url,
CASE
    WHEN client_id IS NULL THEN ''
    ELSE 'https://g-78252d573b.grafana-workspace.eu-west-2.amazonaws.com/d/ga57shrdd/onboarding-dashboard-production?from=now-24h&to=now&timezone=browser&var-LIMIT=100&var-CLIENT_ID=' || client_id ||'&dtab=By-Client-ID&var-CLIENT_ID_copy3=&var-MESSAGE=Validating%20request%20query%20params'
END AS grafana_url,
status,
engagement_manager,
technical_architect,
dept_abbrev,
roadmap,
due_date,
estimated_live_date,
products,
category,
service_count,
rag_status
FROM epics; 