SELECT
    hf.id, hf.globalid, hf.timestamp,
    TRIM(hf.hf_code) as "code",
    TRIM(hf.editor) as "editor",
    TRIM(hf.source) as "source",
    TRIM(hf.primary_name) as "primary_name",
    TRIM(hf.functional_status) as "functional_status",
    TRIM(hf.ownership) as "ownership",
    TRIM(hf.wardcode) as "wardcode",
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