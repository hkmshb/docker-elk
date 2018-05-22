SELECT sch.source, sch.education,
       sch.timestamp, sch.management,
       sch.subtype, sch.category, 
       sch.name, sch.wardcode, 
       sch.globalid, sch.id,
       ST_X (ST_Transform (sch.geom, 4326))::float as longitude, 
       ST_Y (ST_Transform (sch.geom, 4326))::float as latitude, 
       ward.lgacode, ward.wardname, 
       lga.lganame, lga.statecode,
       state.statename 
FROM grid_data.fc_poi_school sch
INNER JOIN grid_data.boundary_vaccwards ward
        ON (ward.wardcode = sch.wardcode)
INNER JOIN grid_data.boundary_vacclgas lga
        ON (lga.lgacode = ward.lgacode)
INNER JOIN grid_data.boundary_vaccstates state
        ON (state.statecode = lga.statecode)