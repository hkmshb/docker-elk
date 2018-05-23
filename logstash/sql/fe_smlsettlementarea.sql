SELECT
     fe.id, fe.globalid, fe.timestamp,
     fe.building_assessment_intact,
     fe.building_assessment_inhabited,
     fe.building_assessment_confidence,
     fe.building_assessment_date,
     TRIM(fe.settlementid) as "settlement_id",
     TRIM(fe.settlementname) as "settlement_name",
     TRIM(fe.settlementobjectid) as "settlement_objectid",
     TRIM(fe.settlementnamecalc) as "settlement_name_calc",
     fe.majorroaddistance as "major_road_distance",
     fe.tertiaryroaddistance as "tertiary_road_distance",
     fe.lgadistance as "lga_distance",
     fe.warddistance as "ward_distance",
     TRIM(fe.wardcode) as "ward_code",
     TRIM(bw.wardname) as "ward_name",
     TRIM(bw.lgacode) as "lga_code",
     TRIM(bl.lganame) as "lga_name",
     TRIM(bl.statecode) as "state_code",
     TRIM(bs.statename) as "state_name",
     fe.weight, fe.nbdenominator, TRIM(fe.source)
FROM grid_data.fe_smlsettlementareas fe
JOIN grid_data.boundary_vaccwards bw
  ON (fe.wardcode = bw.wardcode)
JOIN grid_data.boundary_vacclgas bl
  ON (bw.lgacode = bl.lgacode)
JOIN grid_data.boundary_vaccstates bs
  ON (bl.statecode = bs.statecode)