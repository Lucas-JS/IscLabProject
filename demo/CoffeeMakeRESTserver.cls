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
		<Route Url="/coffeemaker/:id" Method="GET" Call="GetCoffeeMakerInfo"/>
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
		Write tArr.%ToJSON()

		Quit $$$OK
	}
	
	ClassMethod GetCoffeeMakerInfo(id As %String) As %Status
	{
		Set coffeemaker = ##class(demo.coffemaker).%OpenId(id)
		If 'IsObject(coffeemaker) {
			Set %response.Status = ..#HTTP204NOCONTENT
		} Else {
			Set obj = {
				"img": (coffeemaker.Img),
				"coffeemakerID": (coffeemaker.CoffemakerID),
				"name": (coffeemaker.Name),
				"brand": (coffeemaker.Brand),
				"color": (coffemaker.Color),
				"numcups": (coffeemaker.NumCups),
				"price": (coffemaker.Price)
			}
			Write obj.%ToJSON()
		}
		Quit $$$OK
	}
}
















