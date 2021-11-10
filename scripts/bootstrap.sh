#!/usr/bin/env bash


export ENV=$DEV

flux bootstrap github \
    --context=${ENV}\
    --owner=${GITHUB_USER} \
    --repository=${GITHUB_REPO} \
    --branch=dev \
    --personal \
    --path=clusters/dev