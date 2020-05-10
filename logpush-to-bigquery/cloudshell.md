# Cloudflare Log Push

## Set your project ID
```sh
gcloud config set project {{project-id}}
```

## Update the environment variables in deploy.sh
```sh
# required - Use the HTTP or Spectrum schema (schema-http.json or schema-spectrum.json).
SCHEMA=""

# required – The name of Google Cloud Storage bucket used for Cloudflare Logpush logs.
BUCKET_NAME=""

# optional – BigQuery dataset to write to. Will be created if necessary.
DATASET=""

# optional – BigQuery table to write to. Will be created if necessary.
TABLE=""

# optional - Partitioning of the table in BigQuery. default: true.
PARTITIONING=

# optional - Partitioning field for the table in BigQuery (suggested: EdgeStartTimestamp for HTTP, Timestamp for Spectrum). default: EdgeStartTimestamp.
PARTITIONING_FIELD=""

# optional - the name of your Cloud Function. default: gcsbq
FN_NAME=""
```

## Deploy to GCP
```sh
sh ./deploy.sh
```

## Done!
