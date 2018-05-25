SELECT
    fc.id, fc.globalid, fc.timestamp,
    ST_X (ST_Transform (fc.geom, 4326))::float as longitude,
    ST_Y (ST_Transform (fc.geom, 4326))::float as latitude,
    TRIM(fc.source) as "source",
    TRIM(fc.emergency_service_name) as "service_name",
    TRIM(fc.type_emergency_service) as "service_type",
    TRIM(fc.ambulance) as "ambulance",
    TRIM(fc.police_station) as "police_station",
    TRIM(fc.fire_station) as "fire_station",
    fc.functional_fire_vehicle,
    fc.fire_vehicle,
    fc.fire_personel,
    TRIM(fc.wardcode) as "ward_code",
    TRIM(fc.wardname) as "ward_name",
    TRIM(ward.lgacode) as "lga_code",
    TRIM(lga.lganame) as "lga_name",
    TRIM(lga.statecode) as "state_code",
    TRIM(state.statename) as "state_name"
FROM grid_data.fc_emergency_service fc
INNER JOIN grid_data.boundary_vaccwards ward
        ON (ward.wardcode = fc.wardcode)
INNER JOIN grid_data.boundary_vacclgas lga
        ON (lga.lgacode = ward.lgacode)
INNER JOIN grid_data.boundary_vaccstates state
        ON (state.statecode = lga.statecode)