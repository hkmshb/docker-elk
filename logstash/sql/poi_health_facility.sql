SELECT
    fc.id, fc.globalid, fc.timestamp,
    ST_X (ST_Transform (fc.geom, 4326))::float as longitude,
    ST_Y (ST_Transform (fc.geom, 4326))::float as latitude,
    TRIM(fc.source) as "source",
    TRIM(fc.type) as "hf_type",
    TRIM(fc.hf_code) as "hf_code",
    TRIM(fc.primary_name) as "primary_name",
    TRIM(fc.alternate_name) as "alternate_name",
    TRIM(fc.functional_status) as "functional_status",
    TRIM(fc.ri_service_status) as "ri_service_status",
    TRIM(fc.ownership) as "ownership",
    TRIM(fc.accessibility) as "accessibility",
    fc.cce_quantity,
    TRIM(fc.cce_available) as "cce_available",
    TRIM(fc.cce_status) as "cce_status",
    TRIM(fc.cce_source) as "cce_source",
    fc.cce_lastupdated,
    fc.acquisition_year,
    TRIM(fc.maximum_volume) as "maximum_volume",
    TRIM(fc.minimum_volume) as "minimum_volume",
    fc.mnch2_lastupdated,
    TRIM(fc.mnch2) as "mnch2",
    TRIM(fc.wardcode) as "ward_code",
    TRIM(ward.wardname) as "ward_name",
    TRIM(ward.lgacode) as "lga_code",
    TRIM(lga.lganame) as "lga_name",
    TRIM(lga.statecode) as "state_code",
    TRIM(state.statename) as "state_name"
FROM grid_data.fc_poi_health_facilities fc
INNER JOIN grid_data.boundary_vaccwards ward
        ON (ward.wardcode = fc.wardcode)
INNER JOIN grid_data.boundary_vacclgas lga
        ON (lga.lgacode = ward.lgacode)
INNER JOIN grid_data.boundary_vaccstates state
        ON (state.statecode = lga.statecode)