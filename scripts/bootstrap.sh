#!/usr/bin/env bash

flux bootstrap github \
    --context=dev-gitlab\
    --owner=${GITHUB_USER} \
    --repository=${GITHUB_REPO} \
    --branch=dev \
    --personal \
    --path=clusters/dev