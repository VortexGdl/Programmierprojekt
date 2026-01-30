@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Date Value Helper'
define view entity ZI_D_FlightDateVH as select from /dmo/flight
{
  key connection_id as ConnectionId,
  key flight_date as FlightDate
}
