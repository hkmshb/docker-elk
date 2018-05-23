SELECT 
     bs.id, bs.globalid, bs.timestamp,
     TRIM(bs.statecode) as "code",
     TRIM(bs.statename) as "name",
     TRIM(bs.capcity), TRIM(bs.geozone), TRIM(bs.source)
FROM grid_data.boundary_vaccstates bs