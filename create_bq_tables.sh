#!/bin/bash

# This script creates the necessary tables in BigQuery for the Adventure Works DW
# by executing the DDL statements in the specified SQL file.
#
# Prerequisites:
# 1. Google Cloud SDK (`gcloud`) is installed.
# 2. You are authenticated to GCP. Run `gcloud auth login` and `gcloud auth application-default login`.
# 3. The `bq` command-line tool is available and in your PATH.
# 4. You have set your default GCP project. Run `gcloud config set project YOUR_PROJECT_ID`.

set -e # Exit immediately if a command exits with a non-zero status.

# --- Configuration ---
# The script will use the project configured in your gcloud CLI.
GCP_PROJECT_ID="dna-team-day-2025-20251003"
if [ -z "$GCP_PROJECT_ID" ]; then
    echo "Error: GCP Project ID is not set. Please run 'gcloud config set project YOUR_PROJECT_ID' and try again."
    exit 1
fi

# The BigQuery dataset (schema) where the tables will be created.
# This must match the dataset name used in the DDL file.
DATASET_ID="team_day_2025_adventure_works_dw"
DDL_FILE="adventure_works_dw_schema.sql"

# --- Script Body ---

echo "Starting BigQuery table creation..."
echo "Target Project: ${GCP_PROJECT_ID}"
echo "Target Dataset: ${DATASET_ID}"

# 1. Check if the dataset exists, and create it if it doesn't.
echo "--> Checking for dataset '${DATASET_ID}'..."
if bq show --format=prettyjson "${GCP_PROJECT_ID}:${DATASET_ID}" >/dev/null 2>&1; then
    echo "Dataset '${DATASET_ID}' already exists."
else
    echo "Dataset '${DATASET_ID}' not found. Creating it..."
    bq mk --dataset --description "Data warehouse for Adventure Works" "${GCP_PROJECT_ID}:${DATASET_ID}"
    echo "Dataset created successfully."
fi

# 2. Execute the DDL script.
echo "--> Executing DDL from '${DDL_FILE}' to create tables..."
bq query --use_legacy_sql=false < "${DDL_FILE}"

echo ""
echo "----------------------------------------"
echo "Script finished successfully."
echo "All tables should now be created in BigQuery."
echo "----------------------------------------"
