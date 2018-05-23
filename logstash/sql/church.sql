SELECT
    TRIM(hf.source), hf.timestamp,
    TRIM(hf.name), TRIM(hf.wardcode),
    TRIM(hf.poi_type), hf.globalid, hf.id,
    ST_X (ST_Transform (hf.geom, 4326))::float as longitude,
    ST_Y (ST_Transform (hf.geom, 4326))::float as latitude,
    TRIM(ward.lgacode), TRIM(ward.wardname),
    TRIM(lga.lganame), TRIM(lga.statecode),
    TRIM(state.statename)
FROM grid_data.fc_poi_church hf
INNER JOIN grid_data.boundary_vaccwards ward
        ON (ward.wardcode = hf.wardcode)
INNER JOIN grid_data.boundary_vacclgas lga
        ON (lga.lgacode = ward.lgacode)
INNER JOIN grid_data.boundary_vaccstates state
        ON (state.statecode = lga.statecode)