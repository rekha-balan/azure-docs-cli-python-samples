#!/bin/bash

gitrepo=<Replace with your GitHub repo URL>
webappname=mywebapp$RANDOM

# Create a resource group.
az group create --location westeurope --name $webappname

# Create an App Service plan in `FREE` tier.
az appservice plan create --name $webappname --resource-group $webappname --sku FREE

# Create a web app.
az appservice web create --name $webappname --resource-group $webappname --plan $webappname

# Configure GitHub deployment from your GitHub repo and deploy once.
az appservice web source-control config --name $webappname --resource-group $webappname \
--repo-url $gitrepo --branch master

# Browse to the deployed web app. Deployment may be in progress, so rerun this if necessary.
az appservice web browse --name $webappname --resource-group $webappname
