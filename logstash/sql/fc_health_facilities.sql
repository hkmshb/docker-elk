SELECT
    TRIM(hf.hf_code), hf.id,
    TRIM(hf.editor), hf.globalid,
    hf.timestamp, TRIM(hf.source),
    TRIM(hf.wardcode), TRIM(hf.primary_name),
    TRIM(hf.functional_status),
    TRIM(hf.ownership),
    TRIM(hf.type) as "hf_type",
    TRIM(lg.lganame) as "LGA",
    TRIM(wd.wardname) as "Ward",
    TRIM(sta.statename) as "State"
FROM grid_data.fc_poi_health_facilities hf
LEFT JOIN grid_data.boundary_vaccwards wd 
       ON (wd.wardcode = hf.wardcode)
LEFT JOIN grid_data.boundary_vacclgas lg
       ON (lg.lgacode = wd.lgacode)
LEFT JOIN grid_data.boundary_vaccstates sta
       ON (sta.statecode = lg.statecode)