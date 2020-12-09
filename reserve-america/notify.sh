curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/vnd.pagerduty+json;version=2' --header 'From: evgeny.zhuravlev@gmail.com' --header 'Authorization: Token token=-RjkVs1vjFQyjz5WHJKn' -d '{
			"incident": {
				"type": "incident",
				"title": "'"$1"'",
				"service": {
					"id": "PEC7X7A",
					"type": "service_reference"
				}
			}
		}' 'https://api.pagerduty.com/incidents'