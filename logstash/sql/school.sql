SELECT sch.globalid, sch.id, sch.timestamp,
       TRIM(sch.source), TRIM(sch.education),
       TRIM(sch.management), TRIM(sch.subtype),
       TRIM(sch.category), TRIM(sch.name), 
       ST_X (ST_Transform (sch.geom, 4326))::float as longitude, 
       ST_Y (ST_Transform (sch.geom, 4326))::float as latitude, 
       TRIM(ward.lgacode), TRIM(lga.lganame),
       TRIM(sch.wardcode), TRIM(ward.wardname),
       TRIM(lga.statecode), TRIM(state.statename)
FROM grid_data.fc_poi_school sch
INNER JOIN grid_data.boundary_vaccwards ward
        ON (ward.wardcode = sch.wardcode)
INNER JOIN grid_data.boundary_vacclgas lga
        ON (lga.lgacode = ward.lgacode)
INNER JOIN grid_data.boundary_vaccstates state
        ON (state.statecode = lga.statecode)