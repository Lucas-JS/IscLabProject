/// demo class from IS Cache class definition course
Class test.Person Extends (%Persistent,%Populate)
{
	Property Name As %String [Required];
	Property Phone As %String ;
	Property Age As %Integer [Required];


 
Storage Default
{
<Data name="PersonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Phone</Value>
</Value>
<Value name="4">
<Value>Age</Value>
</Value>
</Data>
<DataLocation>^test.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<IdLocation>^test.PersonD</IdLocation>
<IndexLocation>^test.PersonI</IndexLocation>
<StreamLocation>^test.PersonS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}