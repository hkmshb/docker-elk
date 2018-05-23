db_host=${DB_HOST}
db_kano=${DB_KANO}
db_remote=${DB_REMOTE}

dbname_host=${DBNAME_HOST}
dbname_kano=${DBNAME_KANO}
dbname_remote=${DBNAME_REMOTE}

dbuser_host=${DBUSER_HOST}
dbuser_kano=${DBUSER_KANO}
dbuser_remote=${DBUSER_REMOTE}

schema_host=${SCHEMA_HOST}
schema_remote=${SCHEMA_REMOTE}
schema_public=${SCHEMA_PUBLIC}

NOW=`date '+%Y-%m-%d %H:%M:%S'`

exclude=(
  "boundary_vaccstates" "boundary_vacclgas" "boundary_vaccwards"
  "fc_poi_church" "fc_poi_health_facilities" "fc_poi_school"
  "fc_settlementpt" "fe_builtuparea" "fe_hamletareas" 
  "fe_nonresidentialarea" "fe_smlsettlementareas"
  "grid_sw_form1"
)

tables=(
  "fc_poi_church" "fc_poi_mosque" "fc_poi_prison"
  "fc_poi_post_office" "fc_poi_medical"
  "fc_poi_pharmacy" "fc_poi_market"
)

echo 'Starting script at'$NOW

# echo "dumping schema from remote: $db_remote"
# pg_dump -h $db_remote -d $dbname_remote -U $dbuser_remote -v \
#         --format p --schema 'vts_pop' --schema-only \
#         --no-owner --no-privileges  --no-tablespaces \
#         --file ./grid-aws-vts_pop_schema.sql

# echo "dumping schema from remote: $db_kano"
# pg_dump -h $db_kano -d $dbname_kano -U $dbuser_kano -v \
#         --format p --schema $schema_public --schema-only \
#         --no-owner --no-privileges  --no-tablespaces \
#         --file ./grid-kn-pub_schema.sql


for table in "${tables[@]}"
do
    echo 'dumping data (10 rows at a time) for '$schema_remote.$table
    psql -h $db_remote -d $dbname_remote -U $dbuser_remote \
         -c "\copy (select * from $schema_remote.$table limit 10) to $table.csv csv header"

  echo 'restoring data for '$schema_remote.$table
  psql -h $db_host -d $dbname_host -U $dbuser_host \
        -c "\copy $schema_remote.$table FROM $table.csv csv header"
done
echo 'Ending at'$NOW
