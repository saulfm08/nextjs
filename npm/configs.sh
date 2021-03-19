#!/bin/bash

# Recommended setup: configure using AWS CLI
# 1. Configure your npm client using this AWS CLI CodeArtifact command (login authorization expires in 12 hours).
aws codeartifact login --tool npm --repository NPM-Registry --domain devops-study --domain-owner 250664768088

# Manual setup: push to and pull from your repository
# 1. Export a CodeArtifact authorization token for authorization to your repository from your preferred shell (token expires in 12 hours).

export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain devops-study --domain-owner 250664768088 --query authorizationToken --output text`
# 2. Copy the configuration into your home directory (~/) or project .npmrc file. If the .npmrc file does not exist, create one.

registry=https://devops-study-250664768088.d.codeartifact.us-east-1.amazonaws.com/npm/NPM-Registry/
//devops-study-250664768088.d.codeartifact.us-east-1.amazonaws.com/npm/NPM-Registry/:always-auth=true
//devops-study-250664768088.d.codeartifact.us-east-1.amazonaws.com/npm/NPM-Registry/:_authToken=${CODEARTIFACT_AUTH_TOKEN}

