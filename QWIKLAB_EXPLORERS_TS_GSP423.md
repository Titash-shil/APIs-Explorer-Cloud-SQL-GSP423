# || APIs Explorer: Cloud SQL [GSP423](https://www.cloudskillsboost.google/games/5703/labs/36450) ||

## # Like, comment, share & Don't forget to subscribe [Qwiklab_Explorers_ts](https://youtube.com/@titashshil?si=RgamNu1dc9jVIbJN) 👍😄🤝

---
## ⚠️ **Disclaimer:**
#### This script and guide are provided for educational purposes to help you understand the lab process. Please ensure you understand the steps before using any scripts. Before using the script, I encourage you to open and review it to understand each step.The goal is to help you learn how to complete the labs effectively while following Qwiklabs' terms of service and YouTube's community guidelines.
---

- ### Copy & Run :

```

# Set text styles
GREEN=$(tput setaf 2)
BOLD=$(tput bold)
RESET=$(tput sgr0)

echo "Please set the below values correctly"
read -p "${GREEN}${BOLD}Enter the REGION: ${RESET}" REGION

# Export variables after collecting input
export REGION

gcloud services enable sqladmin.googleapis.com

gcloud sql instances create my-instance --project=$DEVSHELL_PROJECT_ID --database-version=MYSQL_5_7 --tier=db-n1-standard-1

gcloud sql databases create mysql-db --instance=my-instance --project=$DEVSHELL_PROJECT_ID

bq mk --dataset $DEVSHELL_PROJECT_ID:mysql_db


bq query --use_legacy_sql=false \
"CREATE TABLE \`${DEVSHELL_PROJECT_ID}.mysql_db.info\` (
  name STRING,
  age INT64,
  occupation STRING
);"


cat > employee_info.csv <<EOF_CP
"Sean", 23, "Content Creator"
"Emily", 34, "Cloud Engineer"
"Rocky", 40, "Event coordinator"
"Kate", 28, "Data Analyst"
"Juan", 51, "Program Manager"
"Jennifer", 32, "Web Developer"
EOF_CP


gsutil mb gs://$DEVSHELL_PROJECT_ID

gsutil cp employee_info.csv gs://$DEVSHELL_PROJECT_ID/

SERVICE_EMAIL=$(gcloud sql instances describe my-instance --format="value(serviceAccountEmailAddress)")

gsutil iam ch serviceAccount:$SERVICE_EMAIL:roles/storage.admin gs://$DEVSHELL_PROJECT_ID/


```

---

## Congratulations ..!!🎉  You completed the lab shortly..😃💯

## *Well done..!* 👏

## Thank you for visiting.... :) 🗯️

## [Qwiklab_Explorers_ts](https://youtube.com/@titashshil?si=RgamNu1dc9jVIbJN)

## Join to our community [Digital Dominators](https://chat.whatsapp.com/J0o1beFGCHfJ8ZHGKjcqkd)
