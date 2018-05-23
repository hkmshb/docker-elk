SELECT
    hf.id, hf.globalid, hf.timestamp,
    ST_X (ST_Transform (hf.geom, 4326))::float as longitude,
    ST_Y (ST_Transform (hf.geom, 4326))::float as latitude,
    TRIM(hf.source) as "source",
    TRIM(hf.name) as "name", 
    TRIM(hf.poi_type) as "poi_type", 
    TRIM(hf.wardcode) as "wardcode",
    TRIM(ward.wardname) as "wardname",
    TRIM(ward.lgacode) as "lgacode", 
    TRIM(lga.lganame) as "lganame", 
    TRIM(lga.statecode) as "statecode",
    TRIM(state.statename) as "statename"
FROM grid_data.fc_poi_church hf
INNER JOIN grid_data.boundary_vaccwards ward
        ON (ward.wardcode = hf.wardcode)
INNER JOIN grid_data.boundary_vacclgas lga
        ON (lga.lgacode = ward.lgacode)
INNER JOIN grid_data.boundary_vaccstates state
        ON (state.statecode = lga.statecode)