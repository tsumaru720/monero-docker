#!/bin/bash

curl -qs https://api.github.com/repos/monero-project/monero/releases/latest | jq -r .tag_name
