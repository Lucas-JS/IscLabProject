/// demo class from IS Cache class definition course
Class test.Person Extends (%Persistent,%Populate)
{
 
Storage Default
{
<Data name="PersonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
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