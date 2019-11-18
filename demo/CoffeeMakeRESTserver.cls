Class demo.CoffeeMakerRESTserver Extends %CSP.REST
{
	XData UrlMap [XMLNamespace = "http://intesystems.com/urlmap" ]
	{
		<Routes>
		<!--
		<Route Url = "/class/:namespace/:classname" Method="GET" Call="GetClass" Cors="True"/>
		<Map Prefix="/docserver" Foward="%Api.v1.DocServer"/>
		-->
		<Route Url="/coffeemakers" Method="GET" Call="GetAll"/>
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