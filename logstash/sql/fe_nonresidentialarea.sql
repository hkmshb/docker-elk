SELECT
     fe.id,
     fe.globalid,
     fe.timestamp,
     TRIM(fe.name),
     fe.type as "type_code",
     TRIM(fe.source)
FROM grid_data.fe_nonresidentialarea fe
