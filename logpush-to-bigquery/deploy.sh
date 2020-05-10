#!/bin/sh

# Google Cloud import and region settings
REGION="us-central1"
BUCKET_NAME="examplecom-logs"
DATASET="cloudflare_data"

# Schema and table settings
TABLE="cloudflare_logs"
SCHEMA="schema-http.json"
PARTITIONING=true
PARTITIONING_FIELD="EdgeStartTimestamp"

# You probably don't need to change this value:
FN_NAME="gcsbq"

gcloud functions deploy $FN_NAME \
  --runtime nodejs8 \
  --trigger-resource $BUCKET_NAME \
  --trigger-event google.storage.object.finalize \
  --region=$REGION \
  --memory=1024MB \
  --entry-point=gcsbq \
  --set-env-vars DATASET=$DATASET,TABLE=$TABLE,SCHEMA=$SCHEMA,PARTITIONING=$PARTITIONING,PARTITIONING_FIELD=$PARTITIONING_FIELD
