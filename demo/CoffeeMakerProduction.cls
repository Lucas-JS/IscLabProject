Class demo.CoffeeMakerProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="demo.CoffeeMakerProduction" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="demo.RESTCoffeeMakerService" Category="" ClassName="demo.RESTCoffeeMakerService" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
  <Item Name="demo.CoffeeMakerBPL" Category="" ClassName="demo.CoffeeMakerBPL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
