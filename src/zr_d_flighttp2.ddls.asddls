@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Flight Restricted View'

define root view entity ZR_D_FlightTP2
  as select from ZI_D_Flight2 as Flight

  composition [0..*] of ZR_D_BookingTP_F as _Bookings

  association [1..1] to ZI_D_FLIGHTVH    as _AirlineName  on $projection.CarrierId = _AirlineName.CarrierId

  association [1..1] to /dmo/airport     as _AirportFrom2 on $projection.AirportFromId = _AirportFrom2.airport_id
  association [1..1] to /dmo/airport     as _AirportTo2   on $projection.AirportToID = _AirportTo2.airport_id

{
  key Flight.CarrierId                                                                                         as CarrierId,
  key Flight.ConnectionId                                                                                      as ConnectionID,
  key Flight.FlightDate                                                                                        as FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => Flight.Price,
                          source_currency    => Flight.CurrencyCode,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => $session.system_date,
                          error_handling     => 'SET_TO_NULL')                                                 as Price,

      cast('EUR' as abap.cuky)                                                                                 as CurrencyCode,
      Flight.PlaneTypeId                                                                                       as PlaneTypeId,
      Flight.SeatsMax                                                                                          as SeatsMax,
      Flight.SeatsOccupied                                                                                     as SeatsOccupied,
      Flight.SeatsMax - Flight.SeatsOccupied                                                                   as AvailableSeats,

      _Connections.airport_from_id                                                                             as AirportFromId,
      _Connections.airport_to_id                                                                               as AirportToID,
      _AirportFrom.name                                                                                        as AirportFromName,
      _AirportTo.name                                                                                          as AirportToName,
      _Carrier.name                                                                                            as CarrierName,
      Flight.ArrivalTime                                                                                       as ArrivalTime,
      Flight.DepartureTime                                                                                     as DepartureTime,
      Flight.Distance                                                                                          as Distance,
      Flight.DistanceUnit                                                                                      as DistanceUnit,

      concat_with_space(concat_with_space(_AirportFrom.name, '-', 1), _AirportTo.name, 1)                      as Route,

      concat(cast(cast((Flight.SeatsOccupied * 100 / Flight.SeatsMax) as abap.dec(4,0)) as abap.char(6)), '%') as Auslastung,

      case  when cast((Flight.SeatsOccupied * 100 / Flight.SeatsMax) as abap.dec(4,0)) < 75 then 3
                            when cast((Flight.SeatsOccupied * 100 / Flight.SeatsMax) as abap.dec(4,0)) < 95 then 2
                            when cast((Flight.SeatsOccupied * 100 / Flight.SeatsMax) as abap.dec(4,0)) <= 100 then 1
                            else 0
                end                                                                                            as  OccupancyCriticality,

      _Bookings,
      _AirlineName,
      _Connections,
      _AirportFrom2,
      _AirportTo2,
      CarrierImageUrl
}

where Flight.FlightDate >= $session.system_date

