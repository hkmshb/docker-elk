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
FROM nigeria_master_trunk_rev_head.fc_settlementpt st
INNER JOIN nigeria_master_trunk_rev_head.boundary_vaccwards wd
        ON (wd.wardcode = st.wardcode)
INNER JOIN nigeria_master_trunk_rev_head.boundary_vacclgas lg
        ON (lg.lgacode = wd.lgacode)
INNER JOIN nigeria_master_trunk_rev_head.boundary_vaccstates sta
        ON (sta.statecode = lg.statecode)