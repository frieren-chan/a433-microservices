#!/bin/bash

# Define variables
IMAGE_NAME="karsajobs"
TAG="latest"
GITHUB_USERNAME="frieren-chan"

# Build Docker image
docker build -t $IMAGE_NAME:$TAG .

# List images
docker images

# Rename image for GHCR (GitHub Container Registry)
docker tag $IMAGE_NAME:$TAG ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG

# Login to GHCR
echo $GHCR_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Push image to GHCR
docker push ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG
