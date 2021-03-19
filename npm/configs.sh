#!/bin/bash

# Recommended setup: configure using AWS CLI
# 1. Configure your npm client using this AWS CLI CodeArtifact command (login authorization expires in 12 hours).
aws codeartifact login --tool npm --repository <repo-name> --domain <domain-name> --domain-owner <aws-acc-id>

# Manual setup: push to and pull from your repository
# 1. Export a CodeArtifact authorization token for authorization to your repository from your preferred shell (token expires in 12 hours).

export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain <domain-name> --domain-owner <aws-acc-id> --query authorizationToken --output text`
# 2. Copy the configuration into your home directory (~/) or project .npmrc file. If the .npmrc file does not exist, create one.

registry=https://<domain-name>-<aws-acc-id>.d.codeartifact.<region>.amazonaws.com/npm/<repo-name>/
//<domain-name>-<aws-acc-id>.d.codeartifact.<region>.amazonaws.com/npm/<repo-name>/:always-auth=true
//<domain-name>-<aws-acc-id>.d.codeartifact.<region>.amazonaws.com/npm/<repo-name>/:_authToken=${CODEARTIFACT_AUTH_TOKEN}

