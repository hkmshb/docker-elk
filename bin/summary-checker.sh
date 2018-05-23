dbname='local'
summary_tables=(
  "boundary_vaccstates" "boundary_vacclgas" "boundary_vaccwards"
  "fc_poi_school" "fc_poi_church" "fc_poi_mosque" "fc_poi_market"
  "fc_poi_health_facilities" "fc_poi_pharmarcy" "fc_poi_prison"
  "fe_builtuparea" "fe_hamletareas" "fe_nonresidentialarea"
  "fe_smlsettlementareas"
)

summary_query="SELECT 'summary: $dbname'"
for table in "${summary_tables[@]}"
do
  echo 'building summary query...'
  summary_query="$summary_query,
    (SELECT COUNT(*) FROM $schema.$table) as \"$table\""
done

echo $summary_query
