name: Build and Deploy WireGuard VPN

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Log in to Koyeb
        uses: koyeb/koyeb-action@v1
        with:
          api_token: ${{ secrets.ecgmmotc22jy52x9zpg5zulgmi5224uukjhb6hmh337jr3tfw8jizs716weqmsrm }}

      - name: Build and Deploy
        run: |
          koyeb app deploy --name vpn-server --image linuxserver/wireguard:latest --region paris
