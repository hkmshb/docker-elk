SELECT
     fe.id,
     fe.globalid,
     fe.timestamp,
     fe.name,
     fe.type as "type_code",
     fe.source
FROM nigeria_master_trunk_rev_head.fe_nonresidentialarea fe
