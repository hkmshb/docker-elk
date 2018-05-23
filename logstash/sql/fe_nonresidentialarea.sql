SELECT
     fe.id,
     fe.globalid,
     fe.timestamp,
     TRIM(fe.name) as "name",
     fe.type as "type_code",
     TRIM(fe.source) as "source"
FROM grid_data.fe_nonresidentialarea fe
