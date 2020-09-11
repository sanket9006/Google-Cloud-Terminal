# 1
# Create the service account:

gcloud iam service-accounts create spinnaker-account \
    --display-name spinnaker-account

# 2
# Store the service account email address and your current project ID in environment variables for use in later commands:

export SA_EMAIL=$(gcloud iam service-accounts list \
    --filter="displayName:spinnaker-account" \
    --format='value(email)')
    
export PROJECT=$(gcloud info --format='value(config.project)')

# 3