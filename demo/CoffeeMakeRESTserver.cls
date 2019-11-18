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
		<Route Url="/newcoffeemaker" Method="POST" Call="NewMaker"/>
		</Routes>
		
	}
	
	ClassMethod GetAll() As %Status
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
	
	ClassMethod NewMaker() As %Status
	{
		If '..GetJSONFromRequest(.obj) {
			Set %response.Status = ..#HTTP400BADREQUEST
			Set error = {"errormessage": "JSON not found"}
			Write error.%ToJSON()
			Quit $$$OK
		}
		
		If '..ValidateJSON(obj,.error) {
			Set %response.Status = ..#HTTP400BADREQUEST
			Write error.%ToJSON()
			Quit $$$OK
		}
		
		Set cm = ##class(demo.coffeemaker).%New()
		Do ..CopyToCoffeemakerFromJSON(.cm,obj)
		
		Set sc = cm.%Save()
		
		Set result={}
		do result.%Set("Status",$s($$$ISERR(sc):$system.Status.GetOneErrorText(sc),1:"OK"))
		write result.%ToJSON()
		
		Quit sc
		
	}

}
















