#!/usr/bin/env bash
export DEV="arn:aws:eks:us-east-2:602955111154:cluster/dev-gitlab"

export ENV=$DEV

flux bootstrap github \
    --context=${ENV}\
    --owner=${GITHUB_USER} \
    --repository=${GITHUB_REPO} \
    --branch=dev \
    --personal \
    --path=clusters/dev