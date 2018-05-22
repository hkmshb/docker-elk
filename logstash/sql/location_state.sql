SELECT 
     bs.id, bs.globalid, bs.timestamp,
     bs.statecode as "code",
     bs.statename as "name",
     bs.capcity, bs.geozone, bs.source
FROM grid_data.boundary_vaccstates bs