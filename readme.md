# Servian DevOps Tech Challenge - Tech Challenge App

[![Build Status][circleci-badge]][circleci]
[![Release][release-badge]][release]
[![GoReportCard][report-badge]][report]
[![License][license-badge]][license]

TODO badges

[circleci-badge]: https://circleci.com/gh/servian/TechChallengeApp.svg?style=shield&circle-token=8dfd03c6c2a5dc5555e2f1a84c36e33bc58ad0aa
[circleci]: https://circleci.com/gh/servian/TechChallengeApp
[release-badge]: http://img.shields.io/github/release/servian/TechChallengeApp/all.svg?style=flat
[release]:https://github.com/Servian/TechChallengeApp/releases
[report-badge]: https://goreportcard.com/badge/github.com/Servian/TechChallengeApp
[report]: https://goreportcard.com/report/github.com/Servian/TechChallengeApp
[license-badge]: https://img.shields.io/github/license/Servian/TechChallengeApp.svg?style=flat
[license]: https://github.com/Servian/TechChallengeApp/license

## Scope/Requirements

### VPC & Subnets
This application will require both a front end and a backend. To facilitate this, we will create a VPC with 3 subnets: Public, private and data. EC2 / Machine hosting this will be deployed in the private layer, the database will be in the data layer. End users should not have direct access to either of these, they will instead have access to the site via a load balancer stored on the public layer.

