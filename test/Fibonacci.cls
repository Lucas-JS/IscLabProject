/// Fibonacci teste
/// Good things are easily destroyed, but not easily created. - Sir Roger Scruton 
Class test.Fibonacci Extends %RegisteredObject
{
ClassMethod Main(pValue)
	{
		Set num = pValue
		For i = 1 : 1 : num {
			Set obj = ##class(Custom.Tr.Classe.Fibonacci).%New()
			Set resultado = obj.FibCalc(i)
			Write "O "_i_" termo de fibonacci eh: "_resultado,!
		}
	}
	
	
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