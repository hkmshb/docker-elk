SELECT
     fe.id,
     fe.globalid,
     fe.timestamp,
     fe.name,
     fe.type as "type_code",
     fe.source
FROM grid_data.fe_nonresidentialarea fe
