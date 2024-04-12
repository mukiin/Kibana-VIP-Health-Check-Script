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


# Elasticsearch Watcher Configuration

## Description

This Elasticsearch Watcher configuration defines a watch that monitors the availability of a Kibana VIP endpoint. If the Kibana endpoint becomes unreachable or returns a non-200 HTTP response code, an email notification is sent to specified recipients.

## Configuration

Before using this watcher configuration, ensure the following parameters are properly configured:

- `YOUR_INDEX_NAME`: The name of the Elasticsearch index being monitored.
- `smtp_account`: The name of the configured SMTP account in Elasticsearch.
- `YOUR@MAIL.COM`: The email address to which notifications will be sent.
- `YOUR@CC.COM`: The email address for carbon copy (cc) recipients.

## Trigger

The watch is triggered based on a schedule defined to run every 15 minutes.

## Input

- The input of the watch is a search request that checks for documents in the specified Elasticsearch index within the last 15 minutes where the HTTP response code is not 200.

## Condition

- The condition checks if the total number of hits returned by the search query is greater than 0, indicating that there are documents matching the condition.

## Actions

- If the condition is met, an email action is triggered.
- The email action sends an email notification using the configured SMTP account to the specified recipients, including the main recipient and any carbon copy recipients.
- The email subject is "Watcher Notification".
- The email body is formatted as an HTML message containing details about the alert, including the timestamp, host information, and a custom message.

## Note

- Ensure that the Elasticsearch Watcher plugin is installed and properly configured.
- Customize the configuration according to your specific Elasticsearch and email setup.
- Replace placeholders such as "YOUR_INDEX_NAME", "smtp_account", "YOUR@MAIL.COM", and "YOUR@CC.COM" with actual values before using the watcher configuration.

