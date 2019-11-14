Class demo.RESTCoffeeMakerService Extends Ens.BusinessService
{

Method OnProcessInput(pInput As demo.GenericCoffeeMakerRequest, Output pOutput As demo.GenericCoffeeMakerResponse) As %Status
{
	set tSC = $$$OK
	try {
				
		set tSC = ..SendRequestSync("demo.CoffeeMakerBPL", pInput, .pOutput)
		
		$$$ThrowOnError(tSC)
	    
	 }
	catch ex {
		set tSC = ex.AsStatus()
	}
	return tSC
}

}
