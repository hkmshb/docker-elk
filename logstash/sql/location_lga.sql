SELECT 
     bl.id, bl.globalid, bl.timestamp,
     TRIM(bl.lgacode) as "code",
     TRIM(bl.lganame) as "name",
     TRIM(bl.statecode) as "parent_code",
     TRIM(bs.statename) as "parent_name",
     TRIM(bl.amapcode), TRIM(bl.source)
FROM grid_data.boundary_vacclgas bl
JOIN grid_data.boundary_vaccstates bs
  ON (bl.statecode = bs.statecode)