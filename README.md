# Sync Gateway and Couchbase Server Deployment with Docker

The goal of this project is to show the deployment and provisioning of a Couchbase Server and Sync Gateway instance using Docker.  Couchbase Server will be deployed and configured to use a specified bucket with various indexes and Sync Gateway will be deployed and then connected to the configured Couchbase Server instance.

## The Project's Involved

This sample deployment will manage the following project:

* [couchbase-sync-gateway-server-example](https://github.com/couchbaselabs/couchbase-sync-gateway-server-example)

The above project depends on an instance of Couchbase Server as well as an instance of Sync Gateway.  The two must work together.

As a result, the following two project's can be involved, optionally:

* [couchbase-lite-javafx-example](https://github.com/couchbaselabs/couchbase-lite-javafx-example)
* [couchbase-lite-gluon-example](https://github.com/couchbaselabs/couchbase-lite-gluon-example)

## What's Happening

A Couchbase Server instance will be deployed with **Index** and **Query** support.  This instance will have a bucket called `fx-example` that contains a primary index used for N1QL queries.

The Sync Gateway file found in this repository will connect to the Couchbase Server instance on **localhost** and the `fx-example` bucket.

Then the Java project found in the main repository will be launched to communicate with both the Sync Gateway instance and Couchbase Server instance.

Although not automated with Docker, the optional two projects can also be used to connect to both instances.