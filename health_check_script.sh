#!/bin/bash
ELASTICSEARCH_HOST="YOUR_HOST"
ELASTICSEARCH_USER="YOUR_ES_USER"
ELASTICSEARCH_PASSWORD="YOUR_ES_PASS"
KIBANA_VIP="YOUR_KIBANA_VIP"
KIBANA_USER="YOUR_KIBANA_USER"
KIBANA_PASSWORD="YOUR_KIBANA_PASS"

HTTP_CODE=$(curl -s -o /dev/null -w '%{http_code}' -u $KIBANA_USER:$KIBANA_PASSWORD -L $KIBANA_VIP:5601)
if [ "$HTTP_CODE" ]; then
    TIMESTAMP=$(date -u +%Y.%m.%d)
    INDEX_NAME="YOUR_INDEX_NAME"
    DOCUMENT="{\"host\": \"$KIBANA_VIP\", \"type\": \"YOUR_INDEX_NAME\", \"http_code\": \"$HTTP_CODE\", \"@timestamp\": \"$(date -u +"%Y-%m-%dT%H:%M:%SZ")\" }"
    RESPONSE=$(curl -s -o /dev/null -w '%{http_code}' -XPOST -u $ELASTICSEARCH_USER:$ELASTICSEARCH_PASSWORD -H 'Content-Type: application/json' http://$ELASTICSEARCH_HOST:9200/$INDEX_NAME/_doc -d "$DOCUMENT")
else
    exit 1
fi
