SELECT 
     bl.id, bl.globalid, bl.timestamp,
     bl.lgacode as "code",
     bl.lganame as "name",
     bl.statecode as "parent_code",
     bs.statename as "parent_name",
     bl.amapcode, bl.source
FROM nigeria_master_trunk_rev_head.boundary_vacclgas bl
JOIN nigeria_master_trunk_rev_head.boundary_vaccstates bs
  ON (bl.statecode = bs.statecode)