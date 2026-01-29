@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Flight Consumption View'

@Metadata.allowExtensions: true

define root view entity ZC_D_FlightTP
  provider contract transactional_query
  as projection on ZR_D_FlightTP2

{
      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_C_CarrierVH', element: 'CarrierId' } } ]

  key CarrierId,

  key ConnectionID,
  key FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,

      CurrencyCode,
      PlaneTypeId,
      AvailableSeats,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_C_AirportVH', element: 'AirportId' } } ]
      AirportFromId,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_C_AirportVH', element: 'AirportId' } } ]
      AirportToID,
      
      AirportFromName,
      AirportToName,
      
      CarrierName,
      
      Route,

      OccupancyCriticality,

      Auslastung,
      _Bookings : redirected to composition child ZC_D_BookingTP_F
}
