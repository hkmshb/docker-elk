SELECT
     fe.id, fe.globalid, fe.timestamp,
     fe.building_assessment_intact,
     fe.building_assessment_inhabited,
     fe.building_assessment_confidence,
     fe.building_assessment_date,
     fe.settlementid as "settlement_id",
     fe.settlementname as "settlement_name",
     fe.settlementobjectid as "settlement_objectid",
     fe.settlementnamecalc as "settlement_name_calc",
     fe.majorroaddistance as "major_road_distance",
     fe.tertiaryroaddistance as "tertiary_road_distance",
     fe.lgadistance as "lga_distance",
     fe.warddistance as "ward_distance",
     fe.wardcode as "ward_code",
     bw.wardname as "ward_name",
     bw.lgacode as "lga_code",
     bl.lganame as "lga_name",
     bl.statecode as "state_code",
     bs.statename as "state_name",
     fe.weight, fe.nbdenominator, fe.source,
     fe.locked
FROM grid_data.fe_hamletareas fe
JOIN grid_data.boundary_vaccwards bw
  ON (fe.wardcode = bw.wardcode)
JOIN grid_data.boundary_vacclgas bl
  ON (bw.lgacode = bl.lgacode)
JOIN grid_data.boundary_vaccstates bs
  ON (bl.statecode = bs.statecode)