@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Booking Consumption View'

@Search.searchable: true

define view entity ZC_D_BookingTP
  as projection on ZR_D_BookingTP2

{
  key TravelId,
  key BookingId,

      BookingDate,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_D_CustomerVH', element: 'CustomerId' } } ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      CustomerId,

      @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Carrier_StdVH', element: 'AirlineID' } } ]
      AirlineId,

      ConnectionId,
      FlightDate,
      FlightPrice,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_CurrencyStdVH', element: 'Currency' } } ]
      CurrencyCode,

      /* Associations */
      _Customer : redirected to parent ZC_D_CustomerTP
}

where FlightDate >= $session.system_date
