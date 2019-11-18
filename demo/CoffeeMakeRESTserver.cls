Class demo.CoffeeMakerRESTserver Extends %CSP.REST
{
	XData UrlMap [XMLNamespace = "http://intesystems.com/urlmap" ]
	{
		<Routes>
		<!--
		<Route Url = "/class/:namespace/:classname" Method = "GET" Call="GetClass" Cors="True"/>
		<Route Url = "/coffemaker" Method="GET" Call="GetAll"/>
		<Map Prefix="/docserver" Foward="%Api.v1.DocServer"/>
		-->
		</Routes>
		
	}
	
	ClassMethod GetAll() As %String
{
	Set tArr = []
	Set rs = ##class(%SQL.Statement).%ExecDirect(,"SELECT * FROM demo.coffeemaker")
	While rs.%Next() {
		Do tArr.%Push({
			"img":    			(rs.%Get("Img")),
			"coffeemakerID":    (rs.%Get("CoffeemakerID")),
			"name": 			(rs.%Get("Name")),
			"brand":        	(rs.%Get("Brand")),
			"color":   			(rs.%Get("Color")),
			"numcups":          (rs.%Get("NumCups")),
			"price":        	(rs.%Get("Price"))
		})
	}
	
	quit tArr.%ToJSON()
}
}