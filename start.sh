gcloud services enable cloudfunctions.googleapis.com && gsutil mb gs://cloudflare-logs-functions/ && gcloud beta functions deploy cflogs-to-big-query --trigger-resource=$BUCKET_NAME --trigger-event google.storage.object.finalize --source=. --stage-bucket=gs://cloudflare-logs-functions --entry-point=jsonLoad
