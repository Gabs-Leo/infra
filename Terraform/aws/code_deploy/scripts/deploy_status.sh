#!/bin/bash
deploy_id=$(aws deploy list-deployments --max-items 1 --application-name test-gabriel-taveira-dev-cicd --deployment-group-name test-gabriel-taveira-dev-deployment-group --query "deployments" --output text | grep "\-d*")

if [ -n "${deploy_id}" ]; then
    aws deploy get-deployment --deployment-id $deploy_id --query "deploymentInfo.[applicationName, status]" --output text
else
    echo "No deployments found"
fi