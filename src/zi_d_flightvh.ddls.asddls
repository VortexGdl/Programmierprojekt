@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Flight'
define view entity ZI_D_FLIGHTVH
  as select from /dmo/carrier
{
  key carrier_id            as CarrierId,
      name                  as Name

}
