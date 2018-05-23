SELECT
    sw.id, sw.created_by,
    sw.url, sw.survey_url,
    sw.attachments_url, sw.created,
    sw.survey, 
    TRIM(sw.form_id) as "form_id",
    TRIM(sw.lga) as "lga", 
    TRIM(lg.lganame) as "lganame",
    TRIM(sw.instanceid) as "instanceid",
    TRIM(sw.ward) as "ward",
    TRIM(wd.wardname) as "wardname",
    TRIM(sw.note1) as "note1",
    TRIM(sw.note6) as "note6",
    TRIM(sw.state) as "state",
    TRIM(st.statename) as "statename",
    TRIM(sw.dc_name) as "dc_name",
    TRIM(sw.endtime) as "endtime",
    TRIM(sw.comments) as "comments",
    TRIM(sw.deviceid) as "deviceid",
    TRIM(sw.poi_name) as "poi_name",
    TRIM(sw.poi_type) as "poi_type",
    TRIM(sw.starttime) as "starttime",
    TRIM(sw.point_type) as "point_type",
    TRIM(sw.latitude) as "latitude",
    TRIM(sw.longitude) as "longitude"
FROM public.grid_sw_form1 sw
LEFT JOIN grid_data.boundary_vaccwards wd
       ON (wd.wardcode = sw.ward)
LEFT JOIN grid_data.boundary_vacclgas lg
       ON (lg.lgacode = wd.lgacode)
LEFT JOIN grid_data.boundary_vaccstates st
       ON (st.statecode = lg.statecode)