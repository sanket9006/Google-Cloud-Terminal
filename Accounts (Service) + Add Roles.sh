# 1
# Create the service account: 

    gcloud iam service-accounts create spinnaker-account \
        --display-name spinnaker-account

    gcloud iam service-accounts create network-admin \
        --display-name network-admin

# 2
# Store the service account email address and your current project ID in environment variables for use in later commands

export SA_EMAIL=$(gcloud iam service-accounts list \
    --filter="displayName:spinnaker-account" \
    --format='value(email)')

export PROJECT=$(gcloud info --format='value(config.project)')


# 3
# Bind the storage.admin role to your service account:
gcloud projects add-iam-policy-binding $PROJECT \
    --role roles/storage.admin \
    --member serviceAccount:$SA_EMAIL

# 4
# Download the service account key
gcloud iam service-accounts keys create spinnaker-sa.json \
     --iam-account $SA_EMAIL