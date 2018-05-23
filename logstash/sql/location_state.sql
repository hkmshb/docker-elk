SELECT 
     bs.id, bs.globalid, bs.timestamp,
     TRIM(bs.statecode) as "code",
     TRIM(bs.statename) as "name",
     TRIM(bs.capcity) as "capcity",
     TRIM(bs.geozone) as "geozone",
     TRIM(bs.source) as "source"
FROM grid_data.boundary_vaccstates bs