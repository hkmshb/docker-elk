SELECT
    hf.hf_code,
    hf.id,
    hf.editor,
    hf.globalid,
    hf.timestamp,
    hf.source,
    hf.wardcode,
    hf.primary_name,
    hf.functional_status,
    hf.type,
    hf.ownership,
    lg.lganame as "LGA",
    wd.wardname as "Ward",
    sta.statename as "State"
FROM nigeria_master_trunk_rev_head.fc_poi_health_facilities hf
LEFT JOIN nigeria_master_trunk_rev_head.boundary_vaccwards wd 
       ON (wd.wardcode = hf.wardcode)
LEFT JOIN nigeria_master_trunk_rev_head.boundary_vacclgas lg
       ON (lg.lgacode = wd.lgacode)
LEFT JOIN nigeria_master_trunk_rev_head.boundary_vaccstates sta
       ON (sta.statecode = lg.statecode)