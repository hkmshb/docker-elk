SELECT 
     bl.id, bl.globalid, bl.timestamp,
     bl.lgacode as "code",
     bl.lganame as "name",
     bl.statecode as "parent_code",
     bs.statename as "parent_name",
     bl.amapcode, bl.source
FROM grid_data.boundary_vacclgas bl
JOIN grid_data.boundary_vaccstates bs
  ON (bl.statecode = bs.statecode)