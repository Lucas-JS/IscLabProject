/// Fibonacci teste
Class demo.Fibonacci Extends %RegisteredObject
{

Method FibCalc(pFator As %Integer) As %Integer
	{
		// x(n) = x(n-1) + x(n-2)
		
		Set n = pFator
		If (n < 2) {
			Set return = n
		}Else{
			Set obj =  ##class(Custom.Tr.Classe.Fibonacci).%New()
			Set ante1 = n - 1
			Set ante2 = n - 2 
			Set return = obj.FibCalc(ante1) + obj.FibCalc(ante2)
		}
		
		Quit return 
	}
	

}