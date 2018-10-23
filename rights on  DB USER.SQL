/* rights on  DB USER */ 
SELECT	USERNAME,'User',
CASE WHEN Abbv.AccessRight IS NOT NULL THEN Abbv.Description ELSE a.AccessRight END AS AccessRighta,
DatabaseName,
GrantAuthority(CHAR(4)),GrantorName,
AllnessFlag 	
FROM	dbc.AllRightsV a
LEFT OUTER JOIN AccessRightsAbbv Abbv
ON A.AccessRight = Abbv.AccessRight
WHERE	DatabaseName LIKE '?DBNaME'
	AND TABLENAME='All' 
AND USERNAME <> DatabaseName                 

UNION	

SELECT	RoleName,'Role',
CASE WHEN Abbv.AccessRight IS NOT NULL THEN Abbv.Description ELSE a.AccessRight END AS AccessRighta ,
DatabaseName,
'Role',GrantorName,'' 
FROM	dbc.AllRoleRightsV  a
LEFT OUTER JOIN AccessRightsAbbv Abbv
ON A.AccessRight = Abbv.AccessRight
WHERE	DatabaseName LIKE '?DBNaME'
	AND TABLENAME='All' 
ORDER BY 1,4

