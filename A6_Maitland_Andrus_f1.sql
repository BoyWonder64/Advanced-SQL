create function regionEmployee
	()
	returns table
	as
	return (select count(EmployeeTerritories.EmployeeID) as EmpCount, Region.RegionID as Region from EmployeeTerritories
	  inner join Territories on Territories.TerritoryID = EmployeeTerritories.TerritoryID
	  inner join Region on Region.RegionID = Territories.RegionID
	  group by Region.RegionID
	
	