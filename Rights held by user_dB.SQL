/*Rights held by user/database */
SELECT	USERNAME , 
CASE WHEN Abbv.AccessRight IS NOT NULL THEN Abbv.Description ELSE a.AccessRight END AS AccessRighta,
DatabaseName,TABLENAME,ColumnName,GrantAuthority,
		GrantorName,AllnessFlag 
FROM	dbc.AllRightsV a
LEFT OUTER JOIN AccessRightsAbbv Abbv
ON A.AccessRight = Abbv.AccessRight
WHERE	USERNAME LIKE '?DBNaME'
AND USERNAME <> DatabaseName                 
ORDER BY 1,3
