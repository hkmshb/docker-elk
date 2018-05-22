SELECT
    hf.hf_code, hf.id,
    hf.editor, hf.globalid,
    hf.timestamp, hf.source,
    hf.wardcode, hf.primary_name,
    hf.functional_status,
    hf.ownership,
    hf.type as "hf_type",
    lg.lganame as "LGA",
    wd.wardname as "Ward",
    sta.statename as "State"
FROM grid_data.fc_poi_health_facilities hf
LEFT JOIN grid_data.boundary_vaccwards wd 
       ON (wd.wardcode = hf.wardcode)
LEFT JOIN grid_data.boundary_vacclgas lg
       ON (lg.lgacode = wd.lgacode)
LEFT JOIN grid_data.boundary_vaccstates sta
       ON (sta.statecode = lg.statecode)