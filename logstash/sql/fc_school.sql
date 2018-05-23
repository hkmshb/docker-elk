SELECT sch.globalid, sch.id, sch.timestamp,
       ST_X (ST_Transform (sch.geom, 4326))::float as longitude,
       ST_Y (ST_Transform (sch.geom, 4326))::float as latitude,
       TRIM(sch.source) as "source",
       TRIM(sch.education) as "education",
       TRIM(sch.management) as "management",
       TRIM(sch.subtype) as "subtype",
       TRIM(sch.category) as "category",
       TRIM(sch.name) as "name",
       TRIM(ward.lgacode) as "lgacode",
       TRIM(lga.lganame) as "lganame",
       TRIM(sch.wardcode) as "wardcode",
       TRIM(ward.wardname) as "wardname",
       TRIM(lga.statecode) as "statecode",
       TRIM(state.statename) as "statename"
FROM grid_data.fc_poi_school sch
INNER JOIN grid_data.boundary_vaccwards ward
        ON (ward.wardcode = sch.wardcode)
INNER JOIN grid_data.boundary_vacclgas lga
        ON (lga.lgacode = ward.lgacode)
INNER JOIN grid_data.boundary_vaccstates state
        ON (state.statecode = lga.statecode)