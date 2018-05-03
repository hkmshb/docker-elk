SELECT 
     bs.id, bs.globalid, bs.timestamp,
     bs.statecode as "code",
     bs.statename as "name",
     bs.capcity, bs.geozone, bs.source
FROM nigeria_master_trunk_rev_head.boundary_vaccstates bs
