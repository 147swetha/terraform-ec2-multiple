#!/bin/bash
terraform -chdir=../ output -json | jq -r '.public_ips.value[]' | \
awk '{print $1}' | sed '1s/^/[web]\n/' > inventory.ini
