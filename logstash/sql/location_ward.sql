SELECT 
     bw.id, bw.globalid, bw.timestamp,
     bw.wardcode as "code",
     bw.wardname as "name",
     bw.lgacode as "parent_code",
     bl.lganame as "parent_name",
     bl.statecode as "state_code",
     bs.statename as "state_name",
     bw.amapcode, bw.urban, bw.source
FROM nigeria_master_trunk_rev_head.boundary_vaccwards bw
JOIN nigeria_master_trunk_rev_head.boundary_vacclgas bl
  ON (bw.lgacode = bl.lgacode)
JOIN nigeria_master_trunk_rev_head.boundary_vaccstates bs
  ON (bl.statecode = bs.statecode)