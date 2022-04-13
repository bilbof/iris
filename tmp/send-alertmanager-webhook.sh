# 1. Create application 'alertmanager' in localhost
# 2. Place key in query param
# https://iris.claims/docs/alertmanager.html#alertmanager-configuration
# https://prometheus.io/docs/alerting/latest/configuration/

# DEMO drop alert

curl -X POST "http://localhost:16649/v0/webhooks/alertmanager?application=alertmanager&key=<key>" \
-H "Content-Type: application/json" \
-d '{
  "version": "4",
  "groupKey": "unimportant demo system down",
  "truncatedAlerts": 3,
  "status": "firing",
  "receiver": "alertmanager",
  "groupLabels": {"iris_plan": "do-nothing", "severity":"critical", "service":"unimportant-demo-system"},
  "commonLabels": {"iris_plan": "do-nothing", "severity":"critical", "service":"unimportant-demo-system"},
  "commonAnnotations": {"team":"infra", "runbook_url": "https://example.org", "description": "The service is down!"},
  "externalURL": "https://alertmanager.example.org",
  "alerts": [
    {
      "status": "firing",
      "labels": {"iris_plan": "do-nothing", "severity":"critical", "service":"unimportant-demo-system"},
      "annotations": {"runbook_url": "https://example.org", "description": "The service is down!"},
      "startsAt": "2022-04-14T07:20:50.52Z",
      "endsAt": "2022-04-14T19:20:50.52Z",
      "generatorURL": "https://alertmanager.example.org",
      "fingerprint": "123456789"
    }
  ]
}'

# DEMO: page-engineer

curl -X POST "http://localhost:16649/v0/webhooks/alertmanager?application=alertmanager&key=<key>" \
-H "Content-Type: application/json" \
-d '{
  "version": "4",
  "groupKey": "Important system down",
  "truncatedAlerts": 3,
  "status": "firing",
  "receiver": "alertmanager",
  "groupLabels": {"iris_plan": "page-engineer", "severity":"critical", "service":"important-system", "team":"infra"},
  "commonLabels": {"iris_plan": "page-engineer", "severity":"critical", "service":"important-system", "team":"infra"},
  "commonAnnotations": {"runbook_url": "https://example.org", "description": "The service is down!"},
  "externalURL": "https://alertmanager.example.org",
  "alerts": [
    {
      "status": "firing",
      "labels": {"iris_plan": "page-engineer", "severity":"critical", "service":"important-system", "team":"infra"},
      "annotations": {"runbook_url": "https://example.org", "description": "The service is down!"},
      "startsAt": "2022-04-14T07:20:50.52Z",
      "endsAt": "2022-04-14T19:20:50.52Z",
      "generatorURL": "https://alertmanager.example.org",
      "fingerprint": "1234567891"
    }
  ]
}'
