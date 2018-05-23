SELECT
    sw.id, sw.created_by,
    sw.url, sw.survey_url,
    sw.attachments_url, sw.created,
    sw.survey, TRIM(sw.form_id),
    TRIM(sw.lga), TRIM(lg.lganame),
    TRIM(sw.instanceid), TRIM(sw.ward),
    TRIM(wd.wardname),
    TRIM(sw.note1), TRIM(sw.note6),
    TRIM(sw.state), TRIM(st.statename),
    TRIM(sw.dc_name), TRIM(sw.endtime),
    TRIM(sw.comments), TRIM(sw.deviceid),
    TRIM(sw.poi_name), TRIM(sw.poi_type),
    TRIM(sw.starttime), TRIM(sw.point_type),
    TRIM(sw.latitude), TRIM(sw.longitude)
FROM public.grid_sw_form1 sw
LEFT JOIN grid_data.boundary_vaccwards wd
       ON (wd.wardcode = sw.ward)
LEFT JOIN grid_data.boundary_vacclgas lg
       ON (lg.lgacode = wd.lgacode)
LEFT JOIN grid_data.boundary_vaccstates st
       ON (st.statecode = lg.statecode)