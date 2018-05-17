SELECT
    hf.source, hf.timestamp, 
    hf.name, hf.wardcode, 
    hf.poi_type, hf.globalid, hf.id, 
    ST_X (ST_Transform (hf.geom, 4326))::float as longitude, 
    ST_Y (ST_Transform (hf.geom, 4326))::float as latitude, 
    ward.lgacode, ward.wardname,
    lga.lganame, lga.statecode,
    state.statename 
FROM nigeria_master_trunk_rev_head.fc_poi_church hf
INNER JOIN nigeria_master_trunk_rev_head.boundary_vaccwards ward
        ON (ward.wardcode = hf.wardcode)
INNER JOIN nigeria_master_trunk_rev_head.boundary_vacclgas lga
        ON (lga.lgacode = ward.lgacode)
INNER JOIN nigeria_master_trunk_rev_head.boundary_vaccstates state
        ON (state.statecode = lga.statecode)