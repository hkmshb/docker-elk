SELECT
    st.id,
    st.editor,
    st.globalid,
    st.timestamp,
    st.source,
    st.wardcode,
    st.settlementname,
    st.settlementid,
    lg.lganame as "LGA",
    wd.wardname as "Ward",
    sta.statename as "State"
FROM grid_data.fc_settlementpt st
INNER JOIN grid_data.boundary_vaccwards wd
        ON (wd.wardcode = st.wardcode)
INNER JOIN grid_data.boundary_vacclgas lg
        ON (lg.lgacode = wd.lgacode)
INNER JOIN grid_data.boundary_vaccstates sta
        ON (sta.statecode = lg.statecode)