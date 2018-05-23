SELECT
    st.id,
    TRIM(st.editor),
    st.globalid,
    st.timestamp,
    TRIM(st.source),
    TRIM(st.wardcode),
    TRIM(st.settlementname),
    TRIM(st.settlementid),
    TRIM(lg.lganame) as "LGA",
    TRIM(wd.wardname) as "Ward",
    TRIM(sta.statename) as "State"
FROM grid_data.fc_settlementpt st
INNER JOIN grid_data.boundary_vaccwards wd
        ON (wd.wardcode = st.wardcode)
INNER JOIN grid_data.boundary_vacclgas lg
        ON (lg.lgacode = wd.lgacode)
INNER JOIN grid_data.boundary_vaccstates sta
        ON (sta.statecode = lg.statecode)