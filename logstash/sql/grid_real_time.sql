SELECT
    sw.id, sw.created_by,
    sw.url, sw.survey_url,
    sw.attachments_url, sw.created,
    sw.survey, sw.form_id,
    sw.lga, lg.lganame,
    sw.instanceid, sw.ward,
    wd.wardname,
    sw.note1, sw.note6,
    sw.state, st.statename,
    sw.dc_name, sw.endtime,
    sw.comments, sw.deviceid,
    sw.poi_name, sw.poi_type,
    sw.starttime, sw.point_type,
    sw.latitude, sw.longitude
FROM public.grid_sw_form1 sw
LEFT JOIN grid_data.boundary_vaccwards wd
       ON (wd.wardcode = sw.ward)
LEFT JOIN grid_data.boundary_vacclgas lg
       ON (lg.lgacode = wd.lgacode)
LEFT JOIN grid_data.boundary_vaccstates st
       ON (st.statecode = lg.statecode)