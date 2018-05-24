SELECT
    poi.id, poi.globalid, poi.timestamp,
    ST_X (ST_Transform (poi.geom, 4326))::float as longitude,
    ST_Y (ST_Transform (poi.geom, 4326))::float as latitude,
    TRIM(poi.name) as "name",
    TRIM(poi.source) as "source",
    TRIM(poi.wardcode) as "ward_code",
    TRIM(ward.wardname) as "ward_name",
    TRIM(ward.lgacode) as "lga_code",
    TRIM(lga.lganame) as "lga_name",
    TRIM(lga.statecode) as "state_code",
    TRIM(state.statename) as "state_name"
FROM grid_data.fc_poi_mosque poi
INNER JOIN grid_data.boundary_vaccwards ward
        ON (ward.wardcode = poi.wardcode)
INNER JOIN grid_data.boundary_vacclgas lga
        ON (lga.lgacode = ward.lgacode)
INNER JOIN grid_data.boundary_vaccstates state
        ON (state.statecode = lga.statecode)