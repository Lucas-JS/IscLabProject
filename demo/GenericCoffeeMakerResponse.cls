Class demo.GenericCoffeeMakerResponse Extends Ens.Response
{

Property JSONResponse As %String(MAXLEN = 5000);

Storage Default
{
<Data name="GenericCoffeeMakerResponseDefaultData">
<Subscript>"GenericCoffeeMakerResponse"</Subscript>
<Value name="1">
<Value>JSONResponse</Value>
</Value>
</Data>
<DefaultData>GenericCoffeeMakerResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
