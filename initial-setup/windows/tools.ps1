# PowerShell 7
winget install --id Microsoft.PowerShell --source winget

# Azure PowerShell
# Run this with Admin Powershell
#Get-ExecutionPolicy -List
#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#Install-Module -Name Az -Repository PSGallery -Force

# Curl
winget install --id curl.curl --source winget

# Github Desktop
winget install --id GitHub.GitHubDesktop --source winget

# Bitwarden
winget install --id Bitwarden.Bitwarden --source winget

# VS Code
winget install --id Microsoft.VisualStudioCode --source winget

# Docker Desktop
winget install --id Docker.DockerDesktop --source winget

# Kubectl
winget install --id Kubernetes.kubectl --source winget

# icloud
winget install --id Apple.iCloud --source winget

# Spotify
winget install --id Spotify.Spotify --source winget

# Terraform
winget install Hashicorp.Terraform --source winget

# Azure CLI
winget install -e --id Microsoft.AzureCLI
$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; Remove-Item .\AzureCLI.msi

# Putty
winget install Putty.Putty --source winget

# MobaXterm
winget install Mobatek.MobaXterm --source winget

# Whatsapp
winget install --id 9NKSQGP7F2NH --source msstore

# Obsidian
winget install --id Obsidian.Obsidian --source winget

# Brave
winget install --id Brave.Brave --source winget

# Anaconda
winget install --id Anaconda.Anaconda3 --source winget

# Python
winget install --id Python.Python.3.12 --source winget

# TradingView
winget install --id Tradingview.TradingViewDesktop --source winget

# Oracle VirtualBox
winget install Oracle.VirtualBox --source winget

# Microsoft Teams
winget install Microsoft.Teams --source winget

# Git
winget install Git.Git --source winget
