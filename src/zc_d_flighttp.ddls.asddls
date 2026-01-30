@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Flight Consumption View'

@Metadata.allowExtensions: true

define root view entity ZC_D_FlightTP
  provider contract transactional_query
  as projection on ZR_D_FlightTP2

{
      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_C_CarrierVH', element: 'CarrierId' } } ]
//@ObjectModel.text.element: [ 'CarrierName' ]
  key CarrierId,

  key ConnectionID,
        @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_D_FlightDateVH', element: 'FlightDate' } } ]
  key FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      @ObjectModel.text.element: [ 'Price' ]  
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
      ArrivalTime,
      DepartureTime,
      Distance,

      @ObjectModel.text.element: [ 'Distance' ]
      @EndUserText.label: 'Distance'
      DistanceUnit,

      Route,
      OccupancyCriticality,
      Auslastung,
      SeatsMax,
      SeatsOccupied,


      _Bookings : redirected to composition child ZC_D_BookingTP_F,
      CarrierImageUrl as CarrierLogo
}

where FlightDate >= $session.system_date
