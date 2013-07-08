select distinct a.Location_Code,
b.CHALLENGE_CODE,
b.CHALLENGE_TYPE,
b.LEP_ELIGIBIL_CODE,
b.LEP_ELIGIBILITY,
b.LOCATION_NAME,
b.POVERTY,
b.POVERTY_CODE,
b.STATE_LOCATION_ID,
b.STUDENT_ID
from clr_ext_20130605_1AM.dbo.NYC_TSDL_Extract b
left join oadm_int.dbo.location_supertable1 a
		on a.system_code=b.state_location_id
where b.course_id in ('51031','51032','51033','51034','51035','51036','52033',
		'52034','52035','52036','52037','52038','53234','53238')
	and a.system_id='BEDS' and a.fiscal_year='2013'