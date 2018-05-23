SELECT 
     bw.id, bw.globalid, bw.timestamp,
     TRIM(bw.wardcode) as "code",
     TRIM(bw.wardname) as "name",
     TRIM(bw.lgacode) as "parent_code",
     TRIM(bl.lganame) as "parent_name",
     TRIM(bl.statecode) as "state_code",
     TRIM(bs.statename) as "state_name",
     TRIM(bw.amapcode) as "amapcode",
     TRIM(bw.urban) as "urban",
     TRIM(bw.source) as "source"
FROM grid_data.boundary_vaccwards bw
JOIN grid_data.boundary_vacclgas bl
  ON (bw.lgacode = bl.lgacode)
JOIN grid_data.boundary_vaccstates bs
  ON (bl.statecode = bs.statecode)