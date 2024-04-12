# Elasticsearch and Kibana Health Check Script

## Description

This script is designed to perform a health check on Kibana instances. It checks the availability of Kibana by sending a request to the specified Kibana VIP (Virtual IP) and then records the HTTP response code along with other relevant information to Elasticsearch.

## Prerequisites

- Bash shell environment
- Curl command-line tool installed
- Access to Elasticsearch and Kibana instances

## Configuration

Before using this script, you need to configure the following parameters:

- `ELASTICSEARCH_HOST`: The hostname or IP address of your Elasticsearch instance.
- `ELASTICSEARCH_USER`: Username for Elasticsearch authentication (if applicable).
- `ELASTICSEARCH_PASSWORD`: Password for Elasticsearch authentication (if applicable).
- `KIBANA_VIP`: The Virtual IP (VIP) address of your Kibana instance.
- `KIBANA_USER`: Username for Kibana authentication (if applicable).
- `KIBANA_PASSWORD`: Password for Kibana authentication (if applicable).
- `INDEX_NAME`: The name of the Elasticsearch index where the health check results will be stored.

## Usage

1. Make sure the script is executable: `chmod +x health_check_script.sh`
2. Run the script: `./health_check_script.sh`
3. Check the output for the status of the health check.

## Script Logic

1. The script sends a request to the Kibana VIP endpoint and retrieves the HTTP response code.
2. If the HTTP response code is received, it constructs a document containing the host information, HTTP response code, and timestamp.
3. The document is then sent to Elasticsearch to be indexed.
4. If Kibana is unreachable, the script exits with a non-zero status code.

## Note

- Ensure that the Elasticsearch and Kibana instances are properly configured and accessible from the machine running the script.
- Replace placeholders such as "YOUR_HOST", "YOUR_ES_USER", etc., with actual values before using the script.
